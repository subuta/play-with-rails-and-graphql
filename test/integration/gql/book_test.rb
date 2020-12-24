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

    test "should allow addBook mutation" do
      query_string = <<-GRAPHQL
      mutation(
        $title: String
        $authorRowId: Int!
      ){
        addBook(
          input: {
            title: $title, 
            authorRowId: $authorRowId
          }
        ) {
          book {
            id
            rowId
            title
          }
          errors
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: {
        title: 'Test book title',
        authorRowId: 1
      })

      assert_equal ({
        "addBook" => {
          "book" => {
            "id" => "Qm9vay02",
            "rowId" => 6,
            "title" => "Test book title"
          },
          "errors" => []
        }
      }), result['data']
    end

    test "should allow updateBook mutation" do
      query_string = <<-GRAPHQL
      mutation(
        $rowId: Int!
        $title: String
        $authorRowId: Int!
      ){
        updateBook(
          input: {
            rowId: $rowId
            title: $title, 
            authorRowId: $authorRowId
          }
        ) {
          book {
            id
            rowId
            title
          }
          errors
        }
      }
      GRAPHQL

      result = AppSchema.execute(query_string, variables: {
        rowId: 1,
        title: 'Test book title',
        authorRowId: 1
      })

      assert_equal ({
        "updateBook" => {
          "book" => {
            "id" => "Qm9vay0x",
            "rowId" => 1,
            "title" => "Test book title"
          },
          "errors" => []
        }
      }), result['data']
    end
  end

end