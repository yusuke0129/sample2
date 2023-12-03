# frozen_string_literal: true

# SampleJob
class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    InquiryMailer.auto_reply(args[0], args[1], args[2]).deliver_now
  end
end
