require "test_helper"

module GQL
  class UserTest < ActiveSupport::TestCase
    test "should avoid n+1 on relay connection query" do
      query_string = <<-GRAPHQL
      query($rowIds: [Int!]){
        users(rowIds: $rowIds, first: 1) {
          totalCount
          
          pageInfo {
            startCursor
            endCursor
            hasNextPage
            hasPreviousPage
          }
          
          nodes {
            id
            rowId
            email
          }
          
          edges {
            cursor
            node {
              id
              rowId
              email

              books {
                title
              }
            }
          }
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: { rowIds: [1, 2, 3, 4, 5] })

      assert_equal ({ "users" => {
        "totalCount" => 5,
        "pageInfo" => {
          "startCursor" => "MQ",
          "endCursor" => "MQ",
          "hasNextPage" => true,
          "hasPreviousPage" => false
        },
        "nodes" => [
          { "id" => "VXNlci0x", "rowId" => 1, "email" => "user-1@example.com" }
        ],
        "edges" => [
          {
            "cursor" => "MQ",
            "node" => {
              "id" => "VXNlci0x",
              "rowId" => 1,
              "email" => "user-1@example.com",
              "books" => [
                { "title" => "Tirra Lirra by the River" }
              ]
            }
          }
        ]
      } }), result['data']
    end
  end
end