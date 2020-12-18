require "test_helper"

module GQL
  class BookTest < ActiveSupport::TestCase
    test "should allow simple query" do
      query_string = <<-GRAPHQL
      query($rowId: Int!){
        book(rowId: $rowId) {
          id
          rowId
          title
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: { rowId: 1 })

      assert_equal ({
        "book" => {
          "id" => "Qm9vay0x",
          "rowId" => 1,
          "title" => "The Golden Bowl"
        }
      }), result['data']
    end

    test "should allow nested query" do
      query_string = <<-GRAPHQL
      query($rowId: Int!){
        book(rowId: $rowId) {
          id
          rowId
          title
          author {
            id
            rowId
            username
          }
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: { rowId: 1 })

      assert_equal ({
        "book" => {
          "id" => "Qm9vay0x",
          "rowId" => 1,
          "title" => "The Golden Bowl",
          "author" => {
            "id" => "VXNlci00",
            "rowId" => 4,
            "username" => "Mrs. Zella Leuschke"
          }
        }
      }), result['data']
    end
  end

end