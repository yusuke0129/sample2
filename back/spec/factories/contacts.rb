# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'test_user' }
    email { 'example@example.com' }
    context { 'sample' }
  end
end
