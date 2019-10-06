# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end
    
  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    sns_id = info[:sns_id]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.sns_id"] = sns_id
      render template: outsidemember_signup_index_path
    end
  end

  def failure
    redirect_to root_path and return
  end
end
