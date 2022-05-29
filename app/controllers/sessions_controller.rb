class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'ログイン成功'
      redirect_to user
    else
      flash.now[:danger] = 'ログイン失敗｜ メールアドレスまたはパスワードに誤りがあります'
      render 'new' #renderの時は'.now'必要
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
