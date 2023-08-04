class Public::DaysController < ApplicationController
  def new
    @day = Day.new
  end

  def create
    plan = Plan.find(params[:plan_id])
    @day = Day.new(day_params)
    @day.plan_id = plan.id
    @day.save
    redirect_to new_plan_day_schedule_path(plan, @day)
  end

  def edit
    @day = Day.find(params[:id])
    @plan = Plan.find(params[:plan_id])
  end

  def update
    plan = Plan.find(params[:plan_id])
    day = Day.find(params[:id])
    day.update(day_params)
    redirect_to check_plan_path(plan)
  end

  def destroy
  end


  private

  def day_params
    params.require(:day).permit(:date)
  end

end
