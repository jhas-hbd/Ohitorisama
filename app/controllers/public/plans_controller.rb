class Public::PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    redirect_to new_plan_day_path(@plan)
  end
  
  def check
    @plan = Plan.find(params[:id])
    @days = @plan.days
  end
  
  def show
    @plan = Plan.find(params[:id])
    @days = @plan.days
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(plan_params)
    redirect_to check_plan_path(plan)
  end
  
  def index
    @plans = Plan.all
  end
  
  
  private

  def plan_params
    params.require(:plan).permit(:title, :prefecture, :stay_days, :budget, :main_vehicle, :impression, :plan_image)
  end
end
