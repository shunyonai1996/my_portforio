class OccupationsController < ApplicationController
  
  def set_occupations
    occupations = Industry.find(params[:id]).occupations
    render json: occupations.all.to_json(only: %i[id name])
  end
end
