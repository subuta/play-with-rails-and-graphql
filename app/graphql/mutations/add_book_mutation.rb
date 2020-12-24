module Mutations
  class AddBookMutation < BaseMutation
    null true

    argument :title, String, required: true
    argument :author_row_id, Integer, required: true

    field :book, Types::BookType, null: true
    field :errors, [String], null: false

    def resolve(title:, author_row_id:)
      book = Book.create(title: title, author_id: author_row_id)
      {
        book: book,
        errors: []
      }
    end
  end
end