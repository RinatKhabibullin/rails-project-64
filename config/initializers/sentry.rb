# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://90b01244e4c741788ca6e60463972a2c@o4505274271072256.ingest.sentry.io/4505274272186368'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.traces_sample_rate = 1.0
end
