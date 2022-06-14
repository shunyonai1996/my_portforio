class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def index
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



  private
    def micropost_params
      params.require(:micropost).permit(:occupation, :job, :content, :time)
    end
end
