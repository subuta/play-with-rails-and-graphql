module Types
  class ReviewType < Types::BaseObject
    graphql_name "Review"

    implements GraphQL::Types::Relay::Node

    # SEE: https://github.com/facebook/relay/issues/1061#issuecomment-227857031
    global_id_field :id

    field :id, GraphQL::Types::ID, null: false
    field :row_id, Integer, null: false

    field :stars, Integer, null: true
    field :comment, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :reviewer_id, Integer, null: true
    field :book_id, Integer, null: true

    field :book, Types::BookType, null: true
    field :reviewer, Types::UserType, null: true

    def book
      Loaders::RecordLoader.for(Book).load(object.book_id)
    end

    def reviewer
      Loaders::RecordLoader.for(User).load(object.reviewer_id)
    end
  end
end
