# frozen_string_literal: true

# InquiryMailer
class InquiryMailer < ApplicationMailer
  def auto_reply(name, email, context)
    @name = name
    @context = context
    mail to: email, subject: 'お問い合わせいただきありがとうございます。'
  end
end
