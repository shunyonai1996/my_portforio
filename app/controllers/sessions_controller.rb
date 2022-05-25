class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログイン成功'
      redirect_to user
    else
      flash.now[:danger] = 'ログイン失敗｜ メールアドレスまたはパスワードに誤りがあります'
      render 'new' #renderの時は'.now'必要
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
