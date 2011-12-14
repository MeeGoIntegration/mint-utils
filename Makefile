default:
	true

install:
	install -d $(DESTDIR)/usr/bin/
	install -d $(DESTDIR)/var/lib/osc-plugins
	install -D -m 755 send_to_OBS.sh        $(DESTDIR)/usr/bin/
	install -D -m 755 mint-from-git.sh        $(DESTDIR)/usr/bin/
	install -D -m 755 project_status.pl     $(DESTDIR)/usr/bin/
	install -D -m 755 newcov.py             $(DESTDIR)/usr/bin/
	install -D -m 755 changes_from_deb	$(DESTDIR)/usr/bin/
	install -D -m 755 addrepos.py			$(DESTDIR)/var/lib/osc-plugins
	install -D -m 755 linkprj.py			$(DESTDIR)/var/lib/osc-plugins

all: default
