ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'bmxmdb.com',
  user_name:            'nick@bmxmdb.com',
  password:             'fHM-m0S-8Uq-aCi',
  authentication:       'plain',
  enable_starttls_auto: true
  }