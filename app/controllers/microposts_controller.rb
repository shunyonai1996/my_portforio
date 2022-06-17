class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def index
    @search_params = search
    @users = User.where(activated: true)
    # @micropost = current_user.microposts.build if logged_in?
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
  end

  def search
    params.fetch(:search, {}).permit(:occupation_id, :job)
  end

  private
    def micropost_params
      params.require(:micropost).permit(:occupation_id, :job, :content, :content_2, :content_3, :content_4, :content_5, :content_6, :content_7, :content_8, :content_9, :content_10, :time, :time_2, :time_3, :time_4, :time_5, :time_6, :time_7, :time_8, :time_9, :time_10)
    end
end
