BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
PUBLISHDIR=$(BASEDIR)/docs
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

dev:
	mkdir -p $(OUTPUTDIR)
	rm -r $(OUTPUTDIR)/css || true
	cp -rf ./css $(OUTPUTDIR)/css
	pelican "$(INPUTDIR)" --autoreload & (cd $(OUTPUTDIR); browser-sync start --server --files "*")

publish:
	mkdir -p $(PUBLISHDIR)
	cp $(BASEDIR)/CNAME $(PUBLISHDIR)/CNAME
	rm -r $(PUBLISHDIR)/css || true
	cp -rf ./css $(PUBLISHDIR)/css
	pelican "$(INPUTDIR)" -s "$(PUBLISHCONF)"

install-deps:
	sudo snap install node --classic
	uv tool install pelican[markdown]
	sudo npm install -g browser-sync
	# Attila theme is a submodule
	git submodule init
	git submodule update
