class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  before_action :logged_in_user,   only: [:index, :edit, :update, :destroy]
  before_action :admin_user,   only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
    @micropost_counts = @users.joins(:microposts).count
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page]).preload(:job_discriptions, :occupation, :likes)
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
      render action: "new"
    end
  end

  def edit
    return unless guest_user?(current_user)
    flash[:danger] = "ゲストユーザーは編集できません"
    redirect_to root_url
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
    if guest_user?(current_user)
      flash[:danger] = "ゲストユーザーは削除できません"
      redirect_to root_url
    else
      User.find(params[:id]).destroy
      flash[:success] = "削除が完了しました"
      redirect_to root_path
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |guest_user|
      guest_user.password = SecureRandom.urlsafe_base64
      guest_user.name = "ゲストユーザー"
      guest_user.birthday = "1994-01-01"
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

  #ログイン済みユーザーかどうか確認
  def logged_in_user
    return if logged_in?
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end
end