module Queries
  class PostQuery < BaseQuery
    type Types::PostType, null: true
    description "Query single post"

    argument :row_id, Integer, required: true

    def resolve(row_id:)
      Post.find(row_id)
    end
  end
end