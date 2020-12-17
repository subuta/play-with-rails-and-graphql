module Queries
  # SEE: https://graphql-ruby.org/api-doc/1.9.2/GraphQL/Types/Relay.html
  class NodesQuery < BaseQuery
    type [GraphQL::Types::Relay::Node, null: true], null: false
    description "Fetches a list of objects given a list of IDs."

    argument :ids, [GraphQL::Types::ID], required: true

    def resolve(ids:)
      ids.map do |id|
        context.schema.object_from_id(id, context)
      end
    end
  end
end