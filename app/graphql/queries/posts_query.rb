module Queries
  class PostsQuery < BaseQuery
    type [Types::PostType], null: false
    description "Query multiple post"

    def resolve
      Post.all
    end
  end
end