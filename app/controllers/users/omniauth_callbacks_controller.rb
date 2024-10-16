# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def twitter
    authorization('X')
  end

  def google_oauth2
    authorization('Google')
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization(provider)
    authenticate_info = User.from_omniauth(request.env['omniauth.auth'])
    @user = authenticate_info[:user]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
    else
      @authenticate_id = authenticate_info[:authenticate].id
      session[:authenticate_id] = @authenticate_id # ここでセッションに保存
      render 'devise/registrations/new'
    end
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
