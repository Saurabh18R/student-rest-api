.PHONY: setup run test clean

setup:
	python -m venv venv
	. venv/bin/activate && pip install -r requirements.txt

run:
	. venv/bin/activate && python -m flask run

test:
	. venv/bin/activate && pytest

clean:
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf venv 