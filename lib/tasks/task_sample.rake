namespace :task_sample do
  desc "サンプルタスク"
  task sample: :environment do
    puts "The number of users is #{User.count} people!"
  end
end
