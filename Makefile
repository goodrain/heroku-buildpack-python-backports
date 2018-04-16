# These targets are not files
.PHONY: tests

test: test-cedar-14

test-cedar-14:
	@echo "Running tests in docker (cedar-14)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=cedar-14" heroku/cedar:14 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""

check:
	@shellcheck -x bin/compile bin/detect bin/release bin/test-compile bin/utils bin/warnings
	@shellcheck -x bin/steps/collectstatic bin/steps/eggpath-fix  bin/steps/eggpath-fix2 bin/steps/gdal bin/steps/geo-libs bin/steps/mercurial bin/steps/nltk bin/steps/pip-install bin/steps/pip-uninstall bin/steps/pipenv bin/steps/pipenv-python-version bin/steps/pylibmc bin/steps/python
	@shellcheck -x bin/steps/hooks/*

test-heroku-16:
	@echo "Running tests in docker (heroku-16)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -it -e "STACK=heroku-16" heroku/heroku:16-build bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""

tools:
	git clone https://github.com/kennethreitz/pip-pop.git
	mv pip-pop/bin/* vendor/pip-pop/
	rm -fr pip-pop