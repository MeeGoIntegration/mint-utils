#!/bin/bash

mkdir -p mint/github mint/gitorious

pushd mint/github

git clone git@github.com:MeeGoIntegration/ruote.git
pushd ruote
git remote add upstream git://github.com/jmettraux/ruote.git
git fetch upstream
popd

git clone git clone git@github.com:MeeGoIntegration/parslet.git
pushd parslet
git remote add upstream git://github.com/kschiess/parslet.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/sourcify.git
pushd sourcify
git remote add upstream git://github.com/ngty/sourcify.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/rufus-json.git
pushd rufus-json
git remote add upstream git://github.com/jmettraux/rufus-json.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/rufus-cloche.git
pushd rufus-cloche
git remote add upstream git://github.com/jmettraux/rufus-cloche.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/rufus-mnemo.git
pushd rufus-mnemo
git remote add upstream git://github.com/jmettraux/rufus-mnemo.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/rufus-scheduler.git
pushd rufus-scheduler
git remote add upstream git://github.com/jmettraux/rufus-scheduler.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/ruote-kit.git
pushd ruote-kit
git remote add upstream git://github.com/kennethkalmer/ruote-kit.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/sinatra-respond_to.git
pushd sinatra-respond_to
git://github.com/cehoffman/sinatra-respond_to.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/sinatra.git
pushd sinatra
git remote add upstream git://github.com/sinatra/sinatra.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/haml.git
pushd haml
git remote add git://github.com/nex3/haml.git
git fetch upstream
popd

git clone git@github.com:MeeGoIntegration/tilt.git
pushd haml
git remote add https://github.com/rtomayko/tilt
git fetch upstream
popd

git git@github.com:MeeGoIntegration/rack-protection.git
pushd haml
git remote add git://github.com/rkh/rack-protection.git
git fetch upstream
popd

popd
pushd mint/gitorious

git clone git@gitorious.org:meego-infrastructure-tools/boss.git
git clone git@gitorious.org:meego-infrastructure-tools/imger.git
git clone git@gitorious.org:meego-infrastructure-tools/ruote-amqp-pyclient.git
git clone git@gitorious.org:meego-infrastructure-tools/python-buildservice.git
git clone git@gitorious.org:meego-infrastructure-tools/boss-skynet.git
git clone git@gitorious.org:meego-infrastructure-tools/boss-python-skynet.git
git clone git@gitorious.org:meego-infrastructure-tools/boss-viewer.git
git clone git@gitorious.org:meego-infrastructure-tools/boss-standard-workflow.git


