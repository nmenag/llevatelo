ActionMailer::Base.smtp_settings = {
  address: ENV["SENDGRID_SMTP_SERVER"] || "smtp.sendgrid.net",
  port: 587,
  domain: ENV["HOSTNAME"],
  user_name: ENV["SENDGRID_USERNAME"],
  password: ENV["SENDGRID_PASSWORD"],
  authentication: :plain,
  enable_starttls_auto: true
}
