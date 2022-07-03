class CommentsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.new(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "エラー"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :micropost_id)
    end
end