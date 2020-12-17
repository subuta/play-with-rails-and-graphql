module Queries
  class PostQuery < BaseQuery
    type Types::PostType, null: true
    description "Query single post"

    argument :id, Integer, required: true

    def resolve(id:)
      Post.find(id)
    end
  end
end