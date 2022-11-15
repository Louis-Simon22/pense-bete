PY?=
PELICAN?=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
PUBLISHDIR=$(BASEDIR)/docs
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py


DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

SERVER ?= "0.0.0.0"

PORT ?= 0
ifneq ($(PORT), 0)
	PELICANOPTS += -p $(PORT)
endif

dev:
	mkdir -p $(OUTPUTDIR)
	cp -rf ./css $(OUTPUTDIR)/css
	pelican content --autoreload & (cd $(OUTPUTDIR); browser-sync start --server --files "*")

publish:
	"$(PELICAN)" "$(INPUTDIR)" -s "$(PUBLISHCONF)" $(PELICANOPTS)
	cp -rf ./css $(PUBLISHDIR)/css

