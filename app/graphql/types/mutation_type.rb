module Types
  class MutationType < Types::BaseObject
    field :add_book, mutation: Mutations::AddBookMutation
    field :update_book, mutation: Mutations::UpdateBookMutation
    field :delete_book, mutation: Mutations::DeleteBookMutation
  end
end
