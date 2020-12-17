# SEE: https://github.com/rmosolgo/graphql-ruby/issues/1825
module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    # methods that should be inherited can go here.
    # like a `current_tenant` method, or methods related
    # to the `context` object
  end
end