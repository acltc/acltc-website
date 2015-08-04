class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, :except => [:cancel]
  
  private

  def sign_up_params
    params.require(:admin).permit(:first_name, :last_name, :title, :email, :avatar, :bio, :avatar_cache, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:admin).permit(:first_name, :last_name, :title, :email, :avatar, :bio, :avatar_cache, :password, :password_confirmation, :current_password)
  end
end