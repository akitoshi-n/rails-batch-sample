namespace :task_sample do
  desc "サンプルタスク"
  task sample: :environment do
    puts "The number of users is #{User.count} people!"
    notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
    notifier.ping("Send test notification from heroku scheduler")
  end
end
