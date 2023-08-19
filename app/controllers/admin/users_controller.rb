class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_guest_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :is_deleted)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      redirect_to admin_users_path, notice: "ゲストユーザーの情報は編集できません。"
    end
  end

end
