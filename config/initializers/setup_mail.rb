ActionMailer::Base.smtp_settings = {
    :address         => "smtp.gmail.com",
    :port            => 587,
    :domain          => "bmxmdb.com",
    :user_name       => "nick@bmxmdb.com",
    :password        => "d1stre55",
    :authentication  => "plain",
    :enable_starttls_auto => true
  }