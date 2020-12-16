require "test_helper"

class GqlSchemaTest < ActiveSupport::TestCase
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

    assert_equal ({ "book" => { "id" => 1, "title" => "Alone on a Wide, Wide Sea" } }), result['data']
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

    assert_equal ({ "book" => { "id" => 1, "title" => "Alone on a Wide, Wide Sea", "author" => { "username" => "Glory Barrows" } } }), result['data']
  end

  test "should avoid n+1 on complex nested query" do
    query_string = <<-GRAPHQL
      query($ids: [Int!]){
        users(ids: $ids) {
          id
          email
          
          books {
            title
          }
        }
      }
    GRAPHQL

    result = AppSchema.execute(query_string, variables: { ids: [1, 2, 3, 4, 5] })

    assert_equal ({ "users" => [
      { "id" => 1, "email" => "user-1@example.com", "books" => [{ "title" => "Tirra Lirra by the River" }] },
      { "id" => 2, "email" => "user-2@example.com", "books" => [{ "title" => "Alone on a Wide, Wide Sea" }, { "title" => "The Line of Beauty" }] },
      { "id" => 3, "email" => "user-3@example.com", "books" => [] },
      { "id" => 4, "email" => "user-4@example.com", "books" => [{ "title" => "The Golden Bowl" }] },
      { "id" => 5, "email" => "user-5@example.com", "books" => [{ "title" => "Cover Her Face" }] }]
    }), result['data']
  end
end
