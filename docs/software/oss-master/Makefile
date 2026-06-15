TARGETS = FugakuSpackGuide.zip \
          oss_usage.zip \
          rccs_sw.zip \
          supported_sw.zip

WORKDIR = PortalContents

all: $(TARGETS)

FugakuSpackGuide.zip: ja/source en/source
	(cd ja; make clean; make html)
	(cd en; make clean; make html)
	mkdir -p $(WORKDIR)/FugakuSpackGuide/build/ja $(WORKDIR)/FugakuSpackGuide/build/en
	cp -pr ja/build/html/* $(WORKDIR)/FugakuSpackGuide/build/ja
	cp -pr en/build/html/* $(WORKDIR)/FugakuSpackGuide/build/en
	(cd $(WORKDIR); zip -r $@ FugakuSpackGuide; rm -f -r FugakuSpackGuide)
	mv $(WORKDIR)/$@ .

oss_usage.zip: oss_usage/ja/source oss_usage/en/source
	(cd oss_usage/ja; make clean; make html)
	(cd oss_usage/en; make clean; make html)
	mkdir -p $(WORKDIR)/oss_usage/build/ja $(WORKDIR)/oss_usage/build/en
	cp -pr oss_usage/ja/build/html/* $(WORKDIR)/oss_usage/build/ja
	cp -pr oss_usage/en/build/html/* $(WORKDIR)/oss_usage/build/en
	(cd $(WORKDIR); zip -r $@ oss_usage; rm -f -r oss_usage)
	mv $(WORKDIR)/$@ .

rccs_sw.zip: rccs_sw/ja/source rccs_sw/en/source
	(cd rccs_sw/ja; make clean; make html)
	(cd rccs_sw/en; make clean; make html)
	mkdir -p $(WORKDIR)/rccs_sw/build/ja $(WORKDIR)/rccs_sw/build/en
	cp -pr rccs_sw/ja/build/html/* $(WORKDIR)/rccs_sw/build/ja
	cp -pr rccs_sw/en/build/html/* $(WORKDIR)/rccs_sw/build/en
	(cd $(WORKDIR); zip -r $@ rccs_sw; rm -f -r rccs_sw)
	mv $(WORKDIR)/$@ .

supported_sw.zip: supported_sw/ja/source supported_sw/en/source
	(cd supported_sw/ja; make clean; make html)
	(cd supported_sw/en; make clean; make html)
	mkdir -p $(WORKDIR)/supported_sw/build/ja $(WORKDIR)/supported_sw/build/en
	cp -pr supported_sw/ja/build/html/* $(WORKDIR)/supported_sw/build/ja
	cp -pr supported_sw/en/build/html/* $(WORKDIR)/supported_sw/build/en
	(cd $(WORKDIR); zip -r $@ supported_sw; rm -f -r supported_sw)
	mv $(WORKDIR)/$@ .


clean:
	rm -rf $(TARGETS) $(WORKDIR)
