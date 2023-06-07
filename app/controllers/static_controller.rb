class StaticController < ApplicationController
  def home
    FakeJob.perform_later({a: 1})

    @trending = fetch_api_data
  end

  private

  def fetch_api_data
    ActiveSupport::Notifications.instrument('APIcall') do
      List.trending
    end
  end
end
