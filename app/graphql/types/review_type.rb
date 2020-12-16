module Types
  class ReviewType < Types::BaseObject
    field :id, Integer, null: false
    field :stars, Integer, null: true
    field :comment, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :reviewer_id, Integer, null: true
    field :book_id, Integer, null: true
  end
end
