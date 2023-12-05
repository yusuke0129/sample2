# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def success(data: nil)
    {
      data: data,
      message: 'you are successed!'
    }
  end

  def fail(data: nil, errors: nil)
    {
      data: data,
      message: 'you are failed!',
      errors: errors
    }
  end
end
