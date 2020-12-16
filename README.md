# play-with-rails-and-graphql
Rails(API Mode) + graphql-ruby + DataLoader example

### How to develop

```
# Run rails new(v6 with API Mode) for creating boilerplate (only first time)
# SEE: https://qiita.com/masuidrive/items/7478fb9101652f2bbae1
docker run --rm -v `pwd`:/usr/src/app ruby:2.5.1 sh -c "curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get update -qq && apt-get install -qq --no-install-recommends nodejs && npm i yarn -g && gem install rails && rails new /usr/src/app --database postgresql --force --api --version 6"

# Start development server/db.
docker-compose up

# Create/Migrate database if needed.
docker-compose exec web bundle exec rake db:create
docker-compose exec web bundle exec rake db:migrate
docker-compose exec web bundle exec rake db:seed

# For reset database(with seed).
docker-compose exec web bundle exec rake db:reset

# Run test with watcher(guard)
docker-compose exec web bundle exec guard --no-interactions
```