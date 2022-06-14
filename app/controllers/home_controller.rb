class HomeController < ApplicationController
  
  def top
    @micropost = current_user.microposts.build if logged_in?
  end

  def policy
  end

  def terms
  end

end
