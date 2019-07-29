# frozen_string_literal: true

# 複数回通知されるのを防ぐため、リトライさせない。リトライさせるときは個別で定義する。
Delayed::Worker.max_attempts = 0

Delayed::Worker.logger = if Rails.env.test?
                           Logger.new('/dev/null')
                         else
                           Logger.new(STDOUT)
                         end
