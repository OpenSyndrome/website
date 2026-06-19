# Site statistics are computed locally (not in the Netlify build) for
# predictability. Generated files under data/charts/ and the world map are
# committed so the deploy just consumes them.

PYTHON := $(shell [ -x .venv/bin/python ] && echo .venv/bin/python || echo python3)

.PHONY: stats charts serve install hooks

## Regenerate everything: chart data + the (non-deterministic) world map.
stats:
	$(PYTHON) bin/stats.py

## Regenerate only the deterministic chart data (no world map churn).
charts:
	$(PYTHON) bin/stats.py --charts-only

## Regenerate chart data, then run the local Hugo preview server.
serve: charts
	hugo server

## Install the Python dependencies used by the stats scripts.
install:
	$(PYTHON) -m pip install -r bin/requirements.txt

## Point git at the versioned hooks (enables the pre-push stats check).
hooks:
	git config core.hooksPath bin/git-hooks
	@echo "git hooks enabled (core.hooksPath=bin/git-hooks)"
