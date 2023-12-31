# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sig
  # GET /resource/edit
  # def edit
  #   super
  # end
  def create
    super
  end
  # PUT /resource
   def update
    super
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  def after_sign_up_path_for(resource)
    posts_path
  end
  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
 
 def configure_sign_up_params
     devise_parameter_sanitizer.permit(
       :sign_up, keys: [ :name, :sex, :introduction, :career, :good_place,  :email, :password, :password_confirmation, :prefecture_id ])
 end

  def configure_account_update_params
     devise_parameter_sanitizer.permit(
       :account_update, keys: [ :name, :sex, :introduction, :career, :good_place,  :email, :password, :password_confirmation, :prefecture_id ])
  end
end
