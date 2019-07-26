require 'clockwork'
require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  configure do |config|
    config[:tz] = 'Asia/Tokyo'
  end

  error_handler do |error|
    Rails.logger.error("occur error")
  end

  handler do |job|
    puts "Runnning #{job}"
  end

  every(1.minute, "sample notification") { SampleJob.perform_later }
end
