class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @plan = Plan.find(params[:plan_id])
    bookmark = current_user.bookmarks.new(plan_id: @plan.id)
    bookmark.save
  end

  def destroy
    @plan = Plan.find(params[:plan_id])
    bookmark = current_user.bookmarks.find_by(plan_id: @plan.id)
    bookmark.destroy
  end

end
