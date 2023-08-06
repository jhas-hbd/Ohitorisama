class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @plans = Plan.all
    @plans = @plans.where(prefecture: plan_params[:prefecture]) if plan_params[:prefecture].present?
    @planss = @plans.where(stay_days: plan_params[:stay_days]) if plan_params[:stay_days].present?
    @plans = @plans.where(budget: plan_params[:budget]) if plan_params[:budget].present?
    @plans = @plans.where(main_vehicle: plan_params[:main_vehicle]) if plan_params[:main_vehicle].present?
    @plans = @plans.where('title LIKE(?) or impression LIKE(?)',"%#{plan_params[:key_word]}%","%#{plan_params[:key_word]}%") if plan_params[:key_word].present?
  end

  def tag_search
    tags = Tag.where('name LIKE(?)',"%#{tag_params[:tag_name]}%") if tag_params[:tag_name].present?
    tags.each do |tag|
      @plans = tag.plans
    end
  end


  private

  def plan_params
    params.permit(:prefecture, :stay_days, :budget, :main_vehicle, :title, :impression, :key_word)
  end

  def tag_params
    params.permit(:tag_name, :tag_id)
  end

end
