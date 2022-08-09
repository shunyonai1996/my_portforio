module SessionsHelper
  #ログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #ログアウト
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  #ユーザのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #現在ログイン中のユーザーを返す
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def guest_user
    user_id = User.find_by(id: "12")
    @guest_user = user_id
  end

  def guest_user?(user)
    user && user == guest_user
  end
  #渡されたユーザがカレントユーザーであればtrueを返す
  def current_user?(user)
    user && user == current_user
  end

  #ログイン中 -> true, その他 -> false
  def logged_in?
    !current_user.nil?
  end

  #記憶したURL（もしくはデフォルト値）にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
