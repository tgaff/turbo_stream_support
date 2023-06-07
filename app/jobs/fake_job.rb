class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep 3
    # Do something later
  end
end
