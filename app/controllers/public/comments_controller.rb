class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:destroy]

  def create
    @plan = Plan.find(params[:plan_id])
    @comment = current_user.comments.new(comment_params)
    @comment.plan_id = @plan.id
    @comment.save
  end

  def destroy
    @plan = Plan.find(params[:plan_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def is_matching_login_user
    plan = Plan.find(params[:plan_id])
    comment = Comment.find(params[:id])
    user = comment.user
    unless user.id == current_user.id
      redirect_to plan_path(plan)
    end
  end

end
