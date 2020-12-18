module Queries
  class UserQuery < BaseQuery
    type Types::UserType, null: true
    description "Query single user"

    argument :row_id, Integer, required: true

    def resolve(row_id:)
      User.find(row_id)
    end
  end
end