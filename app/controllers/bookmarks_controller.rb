class BookmarksController < ApplicationController

  def create
    @micropost = Micropost.find(params[:micropost_id])
    bookmark = @micropost.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      flash[:success] = 'マイページにブックマークを保存しました'
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    bookmark = @micropost.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      flash[:success] = 'ブックマークを解除しました'
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def bookmarklist
    @user = User.find(params[:user_id])
    @bookmarks = @user.bookmarks
  end
end