class Users::OmniauthCallbacksController < ApplicationController

    def google_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
        else
          redirect_to new_user_registration_url
        end
      end
    
      def apple
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: 'Apple') if is_navigational_format?
        else
          redirect_to new_user_registration_url
        end
      end
    
      # Add additional OmniAuth methods if needed
    
      def failure
        redirect_to root_path
      end
end
