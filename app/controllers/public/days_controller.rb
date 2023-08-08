class Public::DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @plan = Plan.find(params[:plan_id])
    @day = Day.new
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @day = Day.new(day_params)
    @day.plan_id = @plan.id
    if @day.save
      redirect_to new_plan_day_schedule_path(@plan, @day)
    else
      render :new
    end
  end

  def edit
    @day = Day.find(params[:id])
    @plan = Plan.find(params[:plan_id])
  end

  def update
    plan = Plan.find(params[:plan_id])
    day = Day.find(params[:id])
    if day.update(day_params)
      redirect_to check_plan_path(plan)
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    day = Day.find(params[:id])
    day.destroy
    redirect_to check_plan_path(plan)
  end


  private

  def day_params
    params.require(:day).permit(:day)
  end

  def is_matching_login_user
    plan = Plan.find(params[:plan_id])
    user = plan.user
    unless user.id == current_user.id
      redirect_to plans_path
    end
  end

end
