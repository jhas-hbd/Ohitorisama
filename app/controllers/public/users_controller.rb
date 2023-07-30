class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end


  private
  def customer_params
    params.require(:user).permit(:name, :introduction)
  end
end
