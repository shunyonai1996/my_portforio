class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = 'ログイン成功'
        redirect_back_or user
      else
        message = 'アカウントを有効化できませんでした。'
        message += 'メールアドレスに送信した有効化リンクを確認してください。'
        flash[:warning] = message
        redirect_to root_url
      end
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