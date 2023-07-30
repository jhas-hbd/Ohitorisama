class Public::UsersController < ApplicationController
  before_action :authenticate_customer!

  def show
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
