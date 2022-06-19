class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def index
    @users = User.where(activated: true)
    @micropost = Micropost.all.order(created_at: :desc).limit(15)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to root_path
    else
      render 'microposts/new/'
    end
  end

  def new
    @micropost = current_user.microposts.build if logged_in?
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  def search
    if params[:id].present?
      @microposts = Micropost.where("occupation_id LIKE ?", "%#{params[:id]}%").paginate(page: params[:page])
      # @microposts = Micropost.where("job LIKE ?", "%#{params[:occupation_id]}%").paginate(page: params[:page])
    else
      flash[:danger] = "職種を選択してください"
      redirect_to root_path
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:occupation_id, :job, :content, :content_2, :content_3, :content_4, :content_5, :content_6, :content_7, :content_8, :content_9, :content_10, :time, :time_2, :time_3, :time_4, :time_5, :time_6, :time_7, :time_8, :time_9, :time_10)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
