class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

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

end
