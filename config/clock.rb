require 'clockwork'
require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  configure do |config|
    config[:tz] = 'JST'
  end

  error_handler do |error|
    Rails.logger.error("occur error")
  end

  handler do |job|
    puts "Runnning #{job}"
  end

  every(1.day, "sample notification", :at => '17:10') { SampleJob.perform_later }
end
