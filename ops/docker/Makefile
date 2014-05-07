ROOT = $(CURDIR)
HERE = $(CURDIR)/$(image)
IMAGE = `cat $(HERE)/REPOSITORY`
TAG = `cat $(HERE)/TAG`
VERSION = $(IMAGE):$(TAG)
VERSION_LATEST = $(IMAGE):latest


install_image:
	@cd $(HERE) \
		&& docker build -t $(VERSION) --rm . \
		&& docker tag $(VERSION) $(VERSION_LATEST)


install_skydns:
	@docker pull crosbymichael/skydns


install_skydock: install_skydns
	@docker pull crosbymichael/skydock


run_skydns:
	@docker run \
		-d \
		-p 172.17.42.1:53:53/udp \
		--name skydns \
		crosbymichael/skydns \
			-nameserver 8.8.8.8:53 \
			-domain ansible


run_skydock: run_skydns
	@docker run \
		-d \
		-v /var/run/docker.sock:/docker.sock \
		--name skydock \
		crosbymichael/skydock \
			-ttl 30 \
			-environment dev \
			-s /docker.sock \
			-domain docker \
			-name skydns


.PHONY: run_skydns run_skydock
