module Connections
  class UserConnection < GraphQL::Types::Relay::BaseConnection
    edge_type(Types::UserType.edge_type)

    field :total_count, Integer, null: false
    def total_count
      # - `object` is the Connection
      # - `object.items` is the original collection of Posts
      object.items.size
    end
  end
end