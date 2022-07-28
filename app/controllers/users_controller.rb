class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  before_action :logged_in_user,   only: [:index, :edit, :update, :destroy]
  # before_action :admin_user,   only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @job_discription = JobDiscription.find(params[:id])
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規登録が完了しました！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除が完了しました"
    redirect_to root_path
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.birthday = "19961028"
    end
    session[:user_id] = user.id
    flash[:success] = "ゲストユーザーとしてログインしました"
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :birthday, :biography, :avatar, :remove_avatar,  :password_confirmation)
    end

  #正しいユーザか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  #管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end