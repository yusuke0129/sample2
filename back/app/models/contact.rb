# frozen_string_literal: true

# Contact model
class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  def error_message
    res = {}
    cnt = 1
    errors.full_messages.each do |message|
      res["message#{cnt}"] = message
      cnt += 1
    end
    res
  end
end
