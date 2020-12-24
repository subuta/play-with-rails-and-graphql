module Mutations
  class UpdateBookMutation < BaseMutation
    null true

    argument :rowId, Integer, required: true
    argument :title, String, required: true
    argument :author_row_id, Integer, required: true

    field :book, Types::BookType, null: true
    field :errors, [String], null: false

    def resolve(title:, author_row_id:, rowId:)
      book = Book.find(rowId)

      book.update(title: title, author_id: author_row_id)

      {
        book: book.reload,
        errors: []
      }
    end
  end
end