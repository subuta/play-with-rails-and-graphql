require "test_helper"

module GQL
  class UserTest < ActiveSupport::TestCase
    test "should allow node query" do
      query_string = <<-GRAPHQL
      query {
        node(id: "MQ") {
          id
        }
        
        nodes(ids: ["MQ", "Mg"]) {
          id
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: {})

      assert_equal ({
        "node"=>{"id"=>"MQ"},
        "nodes"=>[
          {"id"=>"MQ"},
          {"id"=>"Mg"},
        ]
      }), result['data']
    end
  end
end