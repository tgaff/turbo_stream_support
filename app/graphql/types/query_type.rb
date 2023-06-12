module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    description "The query root of this schema"

    # First describe the field signature:
    field :post, PostType, "Find a post by ID" do
      argument :id, ID
    end
    field :posts, [PostType], "All posts"

    def posts
      Post.all
    end

    # Then provide an implementation:
    def post(id:)
      Post.find(id)
    end
    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end
  end
end
