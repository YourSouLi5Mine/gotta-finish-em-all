# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.authentication_keys = [:username]
  config.strip_whitespace_keys = [:username]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  config.rememberable_options = { secure: true }
  config.password_length = 8..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.timeout_in = 30.minutes
  config.lock_strategy = :failed_attempts
  config.unlock_strategy = :time
  config.maximum_attempts = 5
  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  config.sign_out_via = :delete
  config.sign_in_after_change_password = false
end
