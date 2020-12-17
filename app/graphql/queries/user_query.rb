module Queries
  class UserQuery < BaseQuery
    type Types::UserType, null: true
    description "Query single user"

    argument :id, Integer, required: true

    def resolve(id:)
      User.find(id)
    end
  end
end