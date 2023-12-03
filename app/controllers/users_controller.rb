# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: success(data: @user)
  end
end
