require "test_helper"

class GqlSchemaTest < ActiveSupport::TestCase
  test "should allow query" do
    query_string = <<-GRAPHQL
    query($id: Int!){
      book(id: $id) {
        id
        title
      }
    }
    GRAPHQL

    result = AppSchema.execute(query_string, variables: { id: 1 })

    assert_equal ({ "book" => { "id" => 1, "title" => "Alone on a Wide, Wide Sea" } }), result['data']
  end
end
