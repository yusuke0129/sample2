# frozen_string_literal: true

module Api
  module Auth
    # class LoginsController
    class LoginsController < DeviseTokenAuth::SessionsController
      # NOTE: POST /api/auth/sign_in
      # def create  end;

      private

      def resource_params
        params.permit(:name, :email, :password, :password_confirmation, login: %i[email password])
      end
    end
  end
end
