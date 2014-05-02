ROOT = $(CURDIR)
VENV = $(WORKON_HOME)/maestro
REQ = $(ROOT)/requirements.txt

install:
	@/usr/local/bin/virtualenv $(VENV) \
		&& $(VENV)/bin/pip install -r $(REQ)
