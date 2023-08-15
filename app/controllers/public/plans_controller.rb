class Public::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:check, :edit, :update]

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    tag_list = params[:plan][:name].split(',')
    if @plan.save
      @plan.save_tags(tag_list)
      redirect_to new_plan_day_path(@plan)
    else
      render :new
    end
  end

  def check
    @plan = Plan.find(params[:id])
    @days = @plan.days
    @plan_tags = @plan.tags
  end

  def show
    @plan = Plan.find(params[:id])
    @days = @plan.days
    @comment = Comment.new
    @plan_tags = @plan.tags
  end

  def edit
    @plan = Plan.find(params[:id])
    @tag_list = @plan.tags.pluck(:name).join(',')
  end

  def update
    @plan = Plan.find(params[:id])
    tag_list = params[:plan][:name].split(',')
    if @plan.update(plan_params)
      @plan.save_tags(tag_list)
      redirect_to check_plan_path(@plan)
    else
      render :edit
    end
  end

  def index
    @plans = Plan.page(params[:page]).order(created_at: :desc)
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to plans_path
  end


  private

  def plan_params
    params.require(:plan).permit(:title, :prefecture, :stay_days, :budget, :main_vehicle, :impression, :plan_image)
  end

  def is_matching_login_user
    plan = Plan.find(params[:id])
    user = plan.user
    unless user.id == current_user.id
      redirect_to plans_path
    end
  end

end
