# Download and install all available R packages from the CRAN and Bioconductor 
# package repositories
#
RCMD ?= R-1.9.0
WGET ?= wget -N -nd -r -A gz -r -l 1 -nv

PACKAGE_FILES = $(wildcard *.gz ) 
PACKAGE_LOGS  = $(addsuffix .log, $(basename $(basename $(PACKAGE_FILES))))

default: cran bioconductor install

cran: 
	$(WGET) "http://cran.r-project.org/src/contrib/PACKAGES.html"

bioconductor: bioCmain bioCcontrib bioCdata

bioCmain:
	$(WGET) "http://www.bioconductor.org/repository/release1.3/package/html/index.html"

bioCcontrib:
	$(WGET) "http://www.bioconductor.org/contrib/index.html"

bioCdata:
	$(WGET) "http://www.bioconductor.org/data/metaData.html"

install: $(PACKAGE_LOGS)

%.log: %.tar.gz
	$(RCMD) INSTALL $< > $@.broken 2>&1 
	mv $@.broken $@
