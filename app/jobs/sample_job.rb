class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "The number of users is #{User.count} people!"
    notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
    notifier.ping("1分にお知らせを送るよー！")
  end
end
