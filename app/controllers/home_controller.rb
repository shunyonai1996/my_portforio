class HomeController < ApplicationController
  
  def index
    gon.industries = Industry.all.to_json only: %i[id name]
  end
end
