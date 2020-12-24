module Mutations
  class UpdateBookMutation < BaseMutation
    null true

    argument :rowId, Integer, required: true
    argument :title, String, required: true
    argument :author_row_id, Integer, required: false

    field :book, Types::BookType, null: true
    field :errors, [String], null: false

    def resolve(title:, author_row_id: nil, rowId:)
      book = Book.find(rowId)

      payload = {}
      payload[:title] = title if title.present?
      payload[:author_row_id] = author_row_id if author_row_id.present?

      book.update(payload)

      {
        book: book.reload,
        errors: []
      }
    end
  end
end