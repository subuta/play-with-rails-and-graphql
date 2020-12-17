module Types
  class PostType < Types::BaseObject
    graphql_name "Post"

    implements GraphQL::Types::Relay::Node

    # SEE: https://github.com/facebook/relay/issues/1061#issuecomment-227857031
    global_id_field :__id
    field :__id, GraphQL::Types::ID, null: false

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
