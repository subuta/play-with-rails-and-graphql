# play-with-rails-and-graphql
Rails(API Mode) + graphql-ruby + DataLoader example

### Prerequisites

```bash
# If you run relay compiler.
brew install watchman
```

### How to develop

```bash
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
docker-compose exec web bundle exec guard

# Generate current schema as json for client(relay)
docker-compose exec web bundle exec rake gql:dump_schema

# Start development server for front-end
npm run dev

# Start watching relay-compiler
npm run relay -- --watch
```

### References

- [Efficient GraphQL queries in Ruby on Rails & Postgres](https://pganalyze.com/blog/efficient-graphql-queries-in-ruby-on-rails-and-postgres)
- [GraphQL::Batchのサンプルコードを読む & 使ってみる - kymmt](https://blog.kymmt.com/entry/graphql-batch-examples)
- [Split QueryType into separate files · Issue #1825 · rmosolgo/graphql-ruby](https://github.com/rmosolgo/graphql-ruby/issues/1825)
- [kymmt90-sandbox/rails-graphql-batch](https://github.com/kymmt90-sandbox/rails-graphql-batch)
- [graphql-batch/examples at master · Shopify/graphql-batch](https://github.com/Shopify/graphql-batch/tree/master/examples)
- [First dive into GraphQL Ruby - DEV](https://dev.to/tymate/first-dive-into-graphql-ruby-nak)