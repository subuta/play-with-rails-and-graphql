module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :book, Types::BookType, null: true do
      description "An example field added by the generator"
      argument :id, Integer, required: true
    end

    def book(id:)
      Book.find(id)
    end
  end
end
