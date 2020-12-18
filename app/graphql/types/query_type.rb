module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Relay node queries.
    field :node, resolver: Queries::NodeQuery
    field :nodes, resolver: Queries::NodesQuery

    # Example of splitting query into other file.
    # SEE: https://github.com/rmosolgo/graphql-ruby/issues/1825
    field :post, resolver: Queries::PostQuery
    field :posts, resolver: Queries::PostsQuery
    field :user, resolver: Queries::UserQuery
    field :users, resolver: Queries::UsersQuery

    field :book, Types::BookType, null: true do
      description "An example field added by the generator"
      argument :row_id, Integer, required: true
    end

    def book(row_id:)
      Book.find(row_id)
    end

    field :review, Types::ReviewType, null: true do
      description "An example field added by the generator"
      argument :row_id, Integer, required: true
    end

    def review(row_id:)
      Review.find(row_id)
    end
  end
end
