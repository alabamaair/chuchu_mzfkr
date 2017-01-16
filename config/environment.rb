# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    address: 'alabamaair.tk',
    port: 25,
    user_name: ENV["MAILER_EMAIL"],
    password: ENV["MAILER_PASSWORD"],
    authentication: :plain,
    enable_starttls_auto: true,
    openssl_verify_mode: 'none'
}
