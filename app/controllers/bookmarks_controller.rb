class BookmarksController < ApplicationController
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    bookmark = @micropost.bookmarks.new(user_id: current_user.id)
    bookmark.save ? flash[:success] = 'マイページにブックマークを保存しました' : flash[:success] = '処理に失敗しました'
    redirect_to request.referer
  end
  
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    bookmark = @micropost.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      flash[:success] = 'ブックマークを解除しました'
    else
      flash[:success] = '処理に失敗しました'
    end
    redirect_to request.referer
  end

  def bookmarklist
    @user = User.find(params[:user_id])
    @bookmarks = @user.bookmarks.preload(:user, :micropost)
  end
end