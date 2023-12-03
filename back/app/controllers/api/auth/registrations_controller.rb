# frozen_string_literal: true

module Api
  module Auth
    # class RegistrationsController
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      # NOTE: POST /api/auth
      # def create  end;

      private

      def sign_up_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
