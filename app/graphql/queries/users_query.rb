module Queries
  class UsersQuery < BaseQuery
    type Connections::UserConnection, null: false
    description "Query multiple user"

    argument :row_ids, [GraphQL::Types::Int, null: true], required: false

    def resolve(row_ids: [])
      return User.where(id: row_ids) unless row_ids.empty?
      User.all
    end
  end
end