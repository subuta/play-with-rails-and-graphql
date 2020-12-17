require "test_helper"

module GQL
  class PostTest < ActiveSupport::TestCase
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

end