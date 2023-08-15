class Admin::PlansController < ApplicationController
  before_action :authenticate_admin!

  def index
    @plans = Plan.page(params[:page]).per(10)
  end

  def show
    @plan = Plan.find(params[:id])
    @days = @plan.days
    @plan_tags = @plan.tags
  end

  def individual
    @user = User.find(params[:id])
    @plans = @user.plans.page(params[:page]).per(10)
  end

  def comment
    @comments = Comment.page(params[:page]).per(10)
  end

end
