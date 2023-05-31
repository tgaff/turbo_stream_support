Sentry.init do |config|
  config.dsn = 'https://3c043d898b5d4fa4bdb3b24b41b86743@o94632.ingest.sentry.io/4505277883088896'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end

  config.profiles_sample_rate = 1.0
end
