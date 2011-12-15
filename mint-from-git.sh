#!/bin/bash

MINT_GITHUB=git@github.com:MeeGoIntegration
MINT_GITORIOUS=git@gitorious.org:meego-infrastructure-tools

declare -A UPSTREAM
UPSTREAM[ruote]=git://github.com/jmettraux/ruote.git
UPSTREAM[parslet]=git://github.com/kschiess/parslet.git
UPSTREAM[sourcify]=git://github.com/ngty/sourcify.git
UPSTREAM[rufus-json]=git://github.com/jmettraux/rufus-json.git
UPSTREAM[rufus-cloche]=git://github.com/jmettraux/rufus-cloche.git
UPSTREAM[rufus-mnemo]=git://github.com/jmettraux/rufus-mnemo.git
UPSTREAM[rufus-scheduler]=git://github.com/jmettraux/rufus-scheduler.git
UPSTREAM[ruote-kit]=git://github.com/kennethkalmer/ruote-kit.git
UPSTREAM[sinatra-respond_to]=git://github.com/cehoffman/sinatra-respond_to.git
UPSTREAM[sinatra]=git://github.com/sinatra/sinatra.git
UPSTREAM[haml]=git://github.com/nex3/haml.git
UPSTREAM[tilt]=https://github.com/rtomayko/tilt
UPSTREAM[rack]=git://github.com/rack/rack.git
UPSTREAM[rack-protection]=git://github.com/rkh/rack-protection.git


mkdir -p mint/github mint/gitorious

pushd mint/github
for name in \
	ruote\
	parslet\
	sourcify\
	rufus-json\
	rufus-cloche\
	rufus-mnemo\
	rufus-scheduler\
	ruote-kit\
	sinatra\
	haml\
	tilt\
	rack\
	rack-protection
do
    if [ -e $name ]; then
	echo "$name already exists, skipping"
	continue
    fi
    echo "Fetching $name ..."
    git clone $MINT_GITHUB/ruby-$name.git
    pushd ruby-$name
    git remote add upstream ${UPSTREAM[$name]}
    git fetch upstream
    popd
    echo
done
popd

pushd mint/gitorious
for name in \
	boss\
	imger\
	ruote-amqp-pyclient\
	python-buildservice\
	boss-skynet\
	boss-python-skynet\
	boss-viewer\
	boss-standard-workflow
do
    if [ -e $name ]; then
	echo "$name already exists, skipping"
	continue
    fi
    echo "Fetching $name ..."
    git clone $MINT_GITORIOUS/$name.git
    echo
done
popd

