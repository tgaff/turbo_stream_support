# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :text, String
    field :post_id, Integer, null: false
    field :parent_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :post, PostType, null: false
    field :responses, [CommentType], null: false
  end
end
