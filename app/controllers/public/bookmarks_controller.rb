class Public::BookmarksController < ApplicationController
  def create
    plan = Plan.find(params[:plan_id])
    bookmark = current_user.bookmarks.new(plan_id: plan.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    bookmark = current_user.bookmarks.find_by(plan_id: plan.id)
    bookmark.destroy
    redirect_to request.referer
  end

end
