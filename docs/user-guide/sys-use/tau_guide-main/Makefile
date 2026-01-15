TARGETS = TAU_Guide.zip
WORKDIR = PortalContents

all: $(TARGETS)

TAU_Guide.zip: ja/source en/source
	(cd ja; make clean; make html)
	(cd en; make clean; make html)
	mkdir -p $(WORKDIR)/TAU_Guide/build/ja $(WORKDIR)/TAU_Guide/build/en
	cp -pr ja/build/html/* $(WORKDIR)/TAU_Guide/build/ja
	cp -pr en/build/html/* $(WORKDIR)/TAU_Guide/build/en
	(cd $(WORKDIR); zip -r $@ TAU_Guide; rm -f -r TAU_Guide)
	mv $(WORKDIR)/$@ .

clean:
	rm -rf $(TARGETS) $(WORKDIR)
