module Types
  class BookType < Types::BaseObject
    graphql_name "Book"

    implements GraphQL::Types::Relay::Node

    # SEE: https://github.com/facebook/relay/issues/1061#issuecomment-227857031
    global_id_field :id

    field :id, GraphQL::Types::ID, null: false
    field :row_id, Integer, null: false

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
