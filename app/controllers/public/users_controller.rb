class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @plans = @user.plans.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "登録情報を変更しました"
    else
      render :edit
    end
  end

  def bookmark
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:plan_id)
    @bookmark_list = Plan.find(bookmarks)
  end

  def unsubscribe
  end

  def withdraw
    user = User.find(params[:id])
    user.update(is_deleted: true)
    reset_session
    redirect_to new_user_registration_path, notice: "退会しました。"
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    if current_user.guest_user?
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集できません。"
    end
  end

end
