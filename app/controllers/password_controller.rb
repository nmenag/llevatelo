class PasswordController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    # Sign in the user by passing validation in case their password changed
    bypass_sign_in(@user) if @user.update_with_password(user_params)

    redirect_to edit_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
