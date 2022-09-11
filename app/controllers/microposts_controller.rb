class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def index
    @users = User.where(activated: true)
    @microposts = Micropost.all.order(created_at: :desc).limit(15).preload(:user, :job_discriptions, :occupation, :likes)
    gon.industries = Industry.all.to_json only: %i[id name]
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to root_path
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_to request.referrer || root_path
    end
  end

  def new
    @micropost = current_user.microposts.build if logged_in?
    gon.industries = Industry.all.to_json only: %i[id name]
  end

  def show
    @micropost = Micropost.find(params[:id])
    @job_discription = JobDiscription.find(params[:id])
    @comments = @micropost.comments
    @comment = current_user.comments.new
    @user = User.where(params[:id])
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  def search
    if params[:id].present?
      gon.industries = Industry.all.to_json only: %i[id name]
      @occupation = Occupation.find(params[:id])
      @microposts = Micropost.where("occupation_id LIKE ?", "%#{params[:id]}%").paginate(page: params[:page])
    else
      flash[:danger] = "業界と職種を選択してください"
      redirect_to request.referrer || root_path
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:industry_id, :occupation_id, :job, :busyness, :seniority_year, :complement,
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
