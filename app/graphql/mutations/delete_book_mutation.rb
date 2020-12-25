module Mutations
  class DeleteBookMutation < BaseMutation
    null true

    argument :rowId, Integer, required: true

    field :deletedRowId, Integer, null: false
    field :errors, [String], null: false

    def resolve(rowId:)
      Book.find(rowId).destroy!
      {
        deletedRowId: rowId,
        errors: []
      }
    end
  end
end