# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/environment')

# 実行環境を指定
set :environment, ENV['RAILS_ENV'] ||= 'development'

# 出力先のログファイルの指定
set :output, error: "#{Rails.root}/log/cron_error.log", standard: "#{Rails.root}/log/cron.log"

# 1分ごとにコマンドを実行
every 1.minute do
  command "echo 'you cat use raw cron syntax too'"
end
