require 'graphql/batch'

class AppSchema < GraphQL::Schema
  query Types::QueryType
  mutation Types::MutationType

  # SEE: https://github.com/rmosolgo/graphql-ruby/blob/master/guides/relay/object_identification.md
  # SEE: https://github.com/rmosolgo/graphql-ruby/issues/2918#issuecomment-671970909
  # SEE: https://graphql-ruby.org/api-doc/1.9.2/GraphQL/Types/Relay.html
  def self.resolve_type(type, obj, ctx)
    klass = obj.class
    gql_type = "Types::#{klass}Type"
    # # if you have inheritance in models & type
    # # unless const_defined? gql_type
    # # gql_type = "Types::#{klass.superclass}Type"
    # # end
    gql_type.constantize
  end

  # Create UUIDs by joining the type name & ID, then base64-encoding it
  def self.id_from_object(object, type_definition, ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.graphql_name, object.id)
  end

  def self.object_from_id(id, ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    # Now, based on `type_name` and `item_id`
    klass = Object.const_get(type_name)
    Loaders::RecordLoader.for(klass).load(item_id)
  end

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  # For https://github.com/shopify/graphql-batch
  use GraphQL::Batch
end
