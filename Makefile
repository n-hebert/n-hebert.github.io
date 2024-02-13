.PHONY: bundle
bundle:
	bundle

.PHONY: serve
serve: bundle
	bundle exec jekyll serve --detach --quiet

.PHONY: test
test: serve
	xdg-open http://localhost:4000

.PHONY: kill
kill:
	pkill --echo --full --oldest "jekyll serve"
