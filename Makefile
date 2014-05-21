ROOT = $(CURDIR)
PYTHON_VENV = $(WORKON_HOME)/maestro
PYTHON_REQ = $(ROOT)/python/requirements.txt
MAESTRO_CMD = $(PYTHON_VENV)/bin/maestro -f ./ops/maestro/ini.yml
DOCKER_ROOT = $(ROOT)/ops/docker
IMAGE = $(DOCKER_ROOT)/$(image)
IMAGE_REPO = `cat $(IMAGE)/REPOSITORY`
IMAGE_TAG = `cat $(IMAGE)/TAG`
IMAGE_VERSION = $(IMAGE_REPO):$(IMAGE_TAG)
IMAGE_LATEST = $(IMAGE_REPO):latest
DISCOVERY_NAME = skydns
DISCOVERY_HOSTNAME = local


start:
	@$(MAESTRO_CMD) start


stop:
	@$(MAESTRO_CMD) stop


status:
	@$(MAESTRO_CMD) status


python_install:
	@/usr/local/bin/virtualenv $(PYTHON_VENV) \
		&& $(PYTHON_VENV)/bin/pip install -r $(PYTHON_REQ) \
		&& echo $(CURDIR) > $(PYTHON_VENV)/project


image_install:
	@echo $(IMAGE) $(IMAGE_VERSION)
	@cd $(IMAGE) \
		&& docker build -t $(IMAGE_VERSION) --rm . \
		&& docker tag $(IMAGE_VERSION) $(IMAGE_LATEST)


discovery_install:
	@docker pull crosbymichael/skydns \
		&& docker pull crosbymichael/skydock


discovery_start_skydns:
	@docker run \
		-d \
		-p 172.17.42.1:53:53/udp \
		--name $(DISCOVERY_NAME) \
		crosbymichael/skydns:next \
			-nameserver 8.8.8.8:53 \
			-domain $(DISCOVERY_HOSTNAME) \


discovery_start_skydock:
	@docker run \
		-d \
		-v /var/run/docker.sock:/docker.sock \
		--name skydock \
		crosbymichael/skydock:latest \
			-ttl 30 \
			-environment dev \
			-s /docker.sock \
			-domain $(DISCOVERY_HOSTNAME) \
			-name $(DISCOVERY_NAME)


discovery_start: discovery_start_skydns discovery_start_skydock


.PHONY: start stop status
.PHONY: discovery_start_skydns discovery_start_skydock discovery_start
