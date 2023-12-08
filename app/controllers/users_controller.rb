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
  
  def withdraw
    @user = User.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @userr.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_registration_path
  end
 private
  def set_user
      @user = current_user
  end
  
  def user_params
      params.permit(:name, :sex, :introduction, :email, :image, :prefecture_id)
  end
end