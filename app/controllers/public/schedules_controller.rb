class Public::SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @schedule = Schedule.new
    @day = Day.find(params[:day_id])
    @schedules = @day.schedules
    @plan = @day.plan
  end

  def create
    @day = Day.find(params[:day_id])
    @plan = @day.plan
    @schedules = @day.schedules
    @schedule = Schedule.new(schedule_params)
    @schedule.day_id = @day.id
    if @schedule.save
      redirect_to new_day_schedule_path(@day)
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @day = Day.find(params[:day_id])
    @plan = @day.plan
  end

  def update
    @day = Day.find(params[:day_id])
    @plan = @day.plan
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to check_plan_path(@plan)
    else
      render :edit
    end
  end

  def destroy
    day = Day.find(params[:day_id])
    plan = day.plan

    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to check_plan_path(plan)
  end


  private

  def schedule_params
    params.require(:schedule).permit(:start_at, :finished_at, :place, :schedule_comment, :cost, :transportation, :transfer_time, :expense)
  end

  def is_matching_login_user
    day = Day.find(params[:day_id])
    plan = day.plan

    user = plan.user
    unless user.id == current_user.id
      redirect_to plans_path
    end
  end

end
