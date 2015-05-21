class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:username, :password, :remember_me)
    end
  end

  def authenticate_user_from_token!
    email = params[:email].presence
    user  = email && User.find_by_email(email)

    if user && Devise.secure_compare(user.token, params[:token])
      sign_in user, store: false
    end
  end
end
