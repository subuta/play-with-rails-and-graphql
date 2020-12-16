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

  test "should avoid n+1 on complex nested query pattern 2" do
    query_string = <<-GRAPHQL
      query {
        posts {
          id
          title
          author {
            id
            username
          }
        }
      }
    GRAPHQL

    result = AppSchema.execute(query_string, variables: { ids: [1, 2, 3, 4, 5] })

    assert_equal ({ "posts" => [
      { "id" => 1, "title" => "Chuck Norris' preferred IDE is hexedit.", "author" => { "id" => 4, "username" => "Mrs. Zella Leuschke" } },
      { "id" => 2, "title" => "Chuck Norris doesn't need a java compiler, he goes straight to .war", "author" => { "id" => 2, "username" => "Glory Barrows" } },
      { "id" => 3, "title" => "Chuck Norris' programs occupy 150% of CPU, even when they are not executing.", "author" => { "id" => 5, "username" => "Victoria Kris" } },
      { "id" => 4, "title" => "Chuck Norris's beard can type 140 wpm.", "author" => { "id" => 4, "username" => "Mrs. Zella Leuschke" } },
      { "id" => 5, "title" => "Chuck Norris went out of an infinite loop.", "author" => { "id" => 3, "username" => "Griselda Spencer" } }]
    }), result['data']
  end
end
