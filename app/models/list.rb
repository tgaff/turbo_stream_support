class List
  require 'uri'
  require 'net/http'

  include ActiveModel::API
  attr_accessor :id, :title, :description, :views, :published_item_count


  class << self
    def trending
      response_json = trending_api_fetch_cached

      json = JSON.parse response_json
      json['lists'].map do |list|
        new_from_hash(list)
      end
    end

    def new_from_hash(hash)
      hash = hash.with_indifferent_access
      self.new(
        id: hash[:id],
        title: hash.fetch(:title),
        description: hash.fetch(:description),
        views: hash.dig(:stats, :views),
        published_item_count: hash.dig(:stats, :publishedItemCount)
      )
    end

    private

    def trending_api_fetch_cached
      Rails.cache.fetch("listly/trending", expires_in: 5.minutes) do
        trending_api_fetch
      end
    end

    def trending_api_fetch
      uri = URI "https://list.ly/api/v4/lists/trending?page=1&per_page=10"
      res = Net::HTTP.get_response(uri)

      raise ActiveRecord::NotFound unless res.is_a?(Net::HTTPSuccess)
      res.body
    end
  end
end