web: bin/rails server -b 0.0.0.0 -p ${PORT:-3000}
js: yarn build --minify
css: yarn build:css --minify
release: bundle exec rake db:migrate assets:precompile
