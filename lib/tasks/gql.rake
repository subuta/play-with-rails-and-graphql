namespace :gql do
  desc "Dump GraphQL schema"
  task dump_schema: :environment do
    pp AppSchema.execute GraphQL::Introspection::INTROSPECTION_QUERY['data']
  end
end
