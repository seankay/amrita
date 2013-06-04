.PHONY: all test

all: test

test:
	MIX_ENV=test mix do deps.get, test

docs:
	git checkout gh-pages && git rm -rf docs && git commit -m "remove old docs"
	git checkout master
	elixir -pa ebin deps/ex_doc/bin/ex_doc "Amrita" "0.1.0" -m "Amrita" -u "https://github.com/josephwilk/amrita"
	git checkout gh-pages && git add docs && git commit -m "adding new docs" && git push origin gh-pages
	git checkout master
