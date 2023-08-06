class Public::SchedulesController < ApplicationController
  before_action :authenticate_user!

  def new
    @schedule = Schedule.new
    @day = Day.find(params[:day_id])
    @schedules = @day.schedules
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @day = Day.find(params[:day_id])
    @schedules = @day.schedules
    @schedule = Schedule.new(schedule_params)
    @schedule.day_id = @day.id
    if @schedule.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @day = Day.find(params[:day_id])
    @plan = Plan.find(params[:plan_id])
  end

  def update
    plan = Plan.find(params[:plan_id])
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      redirect_to check_plan_path(plan)
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to check_plan_path(plan)
  end


  private

  def schedule_params
    params.require(:schedule).permit(:start_at, :finished_at, :place, :schedule_comment, :cost, :transportation, :transfer_time, :expense)
  end

end
