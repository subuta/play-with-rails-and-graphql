module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Example of splitting query into other file.
    # SEE: https://github.com/rmosolgo/graphql-ruby/issues/1825
    field :post, resolver: Queries::PostQuery
    field :posts, resolver: Queries::PostsQuery
    field :user, resolver: Queries::UserQuery
    field :users, resolver: Queries::UsersQuery

    field :book, Types::BookType, null: true do
      description "An example field added by the generator"
      argument :id, Integer, required: true
    end

    def book(id:)
      Book.find(id)
    end

    field :review, Types::ReviewType, null: true do
      description "An example field added by the generator"
      argument :id, Integer, required: true
    end

    def review(id:)
      Review.find(id)
    end
  end
end
