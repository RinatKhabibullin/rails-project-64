install:
	bundle install
	yarn install
	bin/rails assets:precompile || true
test:
	bundle exec rake test
lint:
	bundle exec rubocop -A
check: install test lint

.PHONY: test