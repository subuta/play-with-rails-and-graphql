module Types
  class PostType < Types::BaseObject
    field :id, Integer, null: false
    field :title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :author_id, Integer, null: true

    field :author, Types::UserType, null: true

    def author
      RecordLoader.for(User).load(object.author_id)
    end
  end
end
