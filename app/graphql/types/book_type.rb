module Types
  class BookType < Types::BaseObject
    graphql_name "Book"

    field :id, Integer, null: false
    field :title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :author_id, Integer, null: true

    field :author, Types::UserType, null: true

    def author
      Loaders::RecordLoader.for(User).load(object.author_id)
    end
  end
end
