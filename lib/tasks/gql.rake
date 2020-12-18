namespace :gql do
  desc "Dump current GraphQL schema into 'front' dir"
  task dump_schema: :environment do
    schema = AppSchema.execute GraphQL::Introspection::INTROSPECTION_QUERY
    schema_json_path = File.expand_path('../../front/app-schema.json', File.dirname(__FILE__))
    File.open(schema_json_path, 'w') do |file|
      file.write(JSON.pretty_generate(schema))
    end
  end
end
