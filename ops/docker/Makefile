ROOT = $(CURDIR)
HERE = $(CURDIR)/$(image)
IMAGE = `cat $(HERE)/REPOSITORY`
TAG = `cat $(HERE)/TAG`
VERSION = $(IMAGE):$(TAG)
VERSION_LATEST = $(IMAGE):latest

install:
	@cd $(HERE) \
		&& docker build -t $(VERSION) --rm . \
		&& docker tag $(VERSION) $(VERSION_LATEST)
