class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: "登録情報を変更しました"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    user = current_user
    user.update(is_deleted: true)
    reset_session
    redirect_to new_user_registration_path, notice: "退会しました。"
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
