module Types
  class UserType < Types::BaseObject
    graphql_name "User"

    field :id, Integer, null: false
    field :email, String, null: true
    field :username, String, null: true
    field :avatar_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :books, [Types::BookType], null: true
    def books
      Loaders::AssociationLoader.for(User, :books).load(object)
    end

    field :posts, [Types::PostType], null: true
    def posts
      Loaders::AssociationLoader.for(User, :posts).load(object)
    end

    field :reviews, [Types::ReviewType], null: true
    def reviews
      Loaders::AssociationLoader.for(User, :reviews).load(object)
    end
  end
end
