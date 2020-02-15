class ApplicationMailer < ActionMailer::Base
  default from: %{ "TestGuru" <mishabigr@yandex.ru> }
  layout 'mailer'
end
