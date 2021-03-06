require "test_helper"

module GQL
  class UserTest < ActiveSupport::TestCase
    test "should allow node query" do
      query_string = <<-GRAPHQL
      query {
        node (id: "VXNlci0y") {
          id
          ... on User {
            rowId
            email
          }
        }
        
        nodes(ids: ["VXNlci0x", "VXNlci0y"]) {
          id
          ... on User {
            rowId
            email
          }
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: {})

      assert_equal ({
        "node" => {
          "id" => "VXNlci0y",
          "rowId" => 2,
          "email" => "user-2@example.com"
        },
        "nodes" => [
          { "id" => "VXNlci0x", "rowId" => 1, "email" => "user-1@example.com" },
          { "id" => "VXNlci0y", "rowId" => 2, "email" => "user-2@example.com" }
        ]
      }), result['data']
    end
  end
end