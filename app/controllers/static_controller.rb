class StaticController < ApplicationController
  def home
    FakeJob.perform_later({a: 1})

    @trending = fetch_api_data
  end

  private

  def fetch_api_data
    ActiveSupport::Notifications.instrument('external-API-fetch') do
      List.trending
    end
  end
end
