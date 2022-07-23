class CommentsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.new(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメント内容を入力してください"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      flash[:success] = "削除が完了しました"
      redirect_to request.referer
    else
      flash[:danger] = "このコメントは削除できません"
      redirect_to request.referer
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :micropost_id)
    end
end