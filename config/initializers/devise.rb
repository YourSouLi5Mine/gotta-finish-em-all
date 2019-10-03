Devise.setup do |config|
  require 'devise/orm/active_record'

  config.authentication_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.password_length = 8..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.lock_strategy = :failed_attempts
  config.unlock_strategy = :time
  config.maximum_attempts = 5
  config.unlock_in = 1.minutes
  config.last_attempt_warning = true
  config.sign_out_via = :delete
  config.omniauth :facebook,
    ENV["APP_ID"],
    ENV["APP_SECRET"],
    scope: 'manage_pages,publish_pages'
end
