class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def index
    @users = User.where(activated: true)
    @microposts = Micropost.all.order(created_at: :desc).limit(15)
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

  def show
    @micropost = Micropost.find(params[:id])
    @job_discription = JobDiscription.find(params[:id])
    @comments = @micropost.comments
    @comment = current_user.comments.new
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  def search
    if params[:id].present?
      @occupation = Occupation.find(params[:id])
      @microposts = Micropost.where("occupation_id LIKE ?", "%#{params[:id]}%").paginate(page: params[:page])
    else
      flash[:danger] = "職種を選択してください"
      redirect_to request.referrer || root_path
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:occupation_id, :job, :busyness, :seniority_year, :complement,
      job_discriptions_attributes: [
        :id,
        :content,
        :time,
        :_destroy
      ])
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
