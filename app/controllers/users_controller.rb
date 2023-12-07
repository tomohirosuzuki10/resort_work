class UsersController < ApplicationController
  before_action :set_user
  
  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
  end
end

private
  def set_user
      @user = current_user
  end
  
  def user_params
      params.permit(:name, :sex, :introduction, :email, :prefecture_id)
  end