module Types
  class UserType < Types::BaseObject
    field :id, Integer, null: false
    field :email, String, null: true
    field :username, String, null: true
    field :avatar_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
