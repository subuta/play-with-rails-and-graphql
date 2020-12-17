module Queries
  class UsersQuery < BaseQuery
    type Connections::UserConnection, null: false
    description "Query multiple user"

    argument :ids, [GraphQL::Types::Int, null: true], required: false

    def resolve(ids:)
      User.where(id: ids)
    end
  end
end