class Public::RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end

  # フォロー一覧
  def follows
    @user = User.find(params[:user_id])
    @users = @user.following_users
  end

  # フォロワー一覧
  def followers
    @user = User.find(params[:user_id])
    @users = @user.follower_users
  end

end
