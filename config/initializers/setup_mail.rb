ActionMailer::Base.smtp_settings = {
  :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE,
  :address              => "mail.trulynx.net",
  :domain               => "trulynx.net",
  :user_name            => "marketing@trulynx.net",
  :password             => "%M30Z}a2C_?R",
  :authentication       => "plain",
  :enable_starttls_auto => true
#  :address              => "smtp.gmail.com",
#  :port                 => 587,
#  :user_name            => "trulynxmarketing",
#  :password             => "m@rketing",
}

#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?