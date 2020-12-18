require "test_helper"

module GQL
  class PostTest < ActiveSupport::TestCase
    test "should avoid n+1 on complex nested query pattern 2" do
      query_string = <<-GRAPHQL
      query {
        posts {
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

      result = AppSchema.execute(query_string, variables: { ids: [1, 2, 3, 4, 5] })

      assert_equal ({
        "posts" => [
          { "id" => "UG9zdC0x", "rowId" => 1, "title" => "Chuck Norris' preferred IDE is hexedit.", "author" => { "id" => "VXNlci00", "rowId" => 4, "username" => "Mrs. Zella Leuschke" } },
          { "id" => "UG9zdC0y", "rowId" => 2, "title" => "Chuck Norris doesn't need a java compiler, he goes straight to .war", "author" => { "id" => "VXNlci0y", "rowId" => 2, "username" => "Glory Barrows" } },
          { "id" => "UG9zdC0z", "rowId" => 3, "title" => "Chuck Norris' programs occupy 150% of CPU, even when they are not executing.", "author" => { "id" => "VXNlci01", "rowId" => 5, "username" => "Victoria Kris" } },
          { "id" => "UG9zdC00", "rowId" => 4, "title" => "Chuck Norris's beard can type 140 wpm.", "author" => { "id" => "VXNlci00", "rowId" => 4, "username" => "Mrs. Zella Leuschke" } },
          { "id" => "UG9zdC01", "rowId" => 5, "title" => "Chuck Norris went out of an infinite loop.", "author" => { "id" => "VXNlci0z", "rowId" => 3, "username" => "Griselda Spencer" } }
        ]
      }), result['data']
    end
  end

end