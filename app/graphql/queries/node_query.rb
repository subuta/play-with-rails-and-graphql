module Queries
  # SEE: https://graphql-ruby.org/api-doc/1.9.2/GraphQL/Types/Relay.html
  class NodeQuery < BaseQuery
    type GraphQL::Types::Relay::Node, null: true
    description "Fetches an object given its ID"

    argument :id, GraphQL::Types::ID, required: true

    def resolve(id:)
      context.schema.object_from_id(id, context)
    end
  end
end