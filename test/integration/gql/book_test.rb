require "test_helper"

module GQL
  class BookTest < ActiveSupport::TestCase
    test "should allow simple query" do
      query_string = <<-GRAPHQL
      query($id: Int!){
        book(id: $id) {
          id
          title
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: { id: 1 })

      assert_equal ({ "book" => { "id" => 1, "title" => "The Golden Bowl" } }), result['data']
    end

    test "should allow nested query" do
      query_string = <<-GRAPHQL
      query($id: Int!){
        book(id: $id) {
          id
          title
          author {
            username
          }
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: { id: 1 })

      assert_equal ({ "book" => { "id" => 1, "title" => "The Golden Bowl", "author" => { "username" => "Mrs. Zella Leuschke" } } }), result['data']
    end
  end

end