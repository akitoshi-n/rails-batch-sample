require 'clockwork'
require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)

module Clockwork
  handler do |job|
    puts "Runnning #{job}"
  end

  every(1.minute, "sample 1 minute") {
    `rake task_sample:sample`
  }
end
