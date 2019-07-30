require 'clockwork'
require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  configure do |config|
    config[:tz] = 'Asia/Tokyo'
  end

  error_handler do |e|
    Rails.logger.error e.class
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")
    notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
    notifier.ping("[Clockwork] #{e.message}")
  end

  every(1.day, "sample notification", at: '12:00') { SampleJob.perform_later }
end
