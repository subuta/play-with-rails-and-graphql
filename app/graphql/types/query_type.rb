module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Example of splitting query into other file.
    # SEE: https://github.com/rmosolgo/graphql-ruby/issues/1825
    field :post, resolver: Queries::PostQuery
    field :posts, resolver: Queries::PostsQuery

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

    field :user, Types::UserType, null: true do
      description "An example field added by the generator"
      argument :id, Integer, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :users, [Types::UserType], null: false do
      description "An example field added by the generator"
      argument :ids, [GraphQL::Types::Int, null: true], required: false
    end

    def users(ids:)
      # User.where(id: ids)
      User.where(id: ids)
    end
  end
end
