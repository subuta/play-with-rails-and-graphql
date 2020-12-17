require 'graphql/batch'

# Default orphan types.
# SEE: https://github.com/rmosolgo/graphql-ruby/issues/2918#issuecomment-624817510
class ObjectType < GraphQL::Schema::Object
  implements GraphQL::Types::Relay::Node

  field :id, GraphQL::Types::ID, null: false
  field :foo, String, null: false
end

class AppSchema < GraphQL::Schema
  query Types::QueryType
  mutation Types::MutationType

  orphan_types ObjectType

  # SEE: https://github.com/rmosolgo/graphql-ruby/issues/2918#issuecomment-671970909
  # SEE: https://graphql-ruby.org/api-doc/1.9.2/GraphQL/Types/Relay.html
  def self.resolve_type(type, obj, ctx)
    # pp obj
    # klass = obj.class
    # pp klass
    # gql_type = "Types::#{klass}Type"
    # # if you have inheritance in models & type
    # # unless const_defined? gql_type
    # # gql_type = "Types::#{klass.superclass}Type"
    # # end
    # gql_type.constantize
    ObjectType
  end

  def self.object_from_id(id, ctx)
    { id: id }
  end

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  # For https://github.com/shopify/graphql-batch
  use GraphQL::Batch
end
