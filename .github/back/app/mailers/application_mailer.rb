# frozen_string_literal: true

# ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: 'noreplay@example.com'
  layout 'mailer'
end
