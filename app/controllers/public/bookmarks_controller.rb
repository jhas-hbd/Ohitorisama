class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

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

  def index
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:plan_id)
    @bookmark_list = Plan.find(bookmarks)
  end

end
