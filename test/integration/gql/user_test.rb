require "test_helper"

module GQL
  class UserTest < ActiveSupport::TestCase
    test "should avoid n+1 on relay query" do
      query_string = <<-GRAPHQL
      query($ids: [Int!]){
        users(ids: $ids, first: 1) {
          totalCount
          
          pageInfo {
            startCursor
            endCursor
            hasNextPage
            hasPreviousPage
          }
          
          nodes {
            id
            email
          }
          
          edges {
            cursor
            node {
              id
              email

              books {
                title
              }
            }
          }
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: { ids: [1, 2, 3, 4, 5] })

      assert_equal ({ "users" => {
        "totalCount" => 5,
        "pageInfo" => {
          "startCursor" => "MQ",
          "endCursor" => "MQ",
          "hasNextPage" => true,
          "hasPreviousPage" => false
        },
        "nodes" => [
          { "id" => 1, "email" => "user-1@example.com" }
        ],
        "edges" => [
          { "cursor" => "MQ",
            "node" => {
              "id" => 1,
              "email" => "user-1@example.com",
              "books" => [
                { "title" => "Tirra Lirra by the River" }
              ]
            }
          }]
      } }), result['data']
    end
  end
end