class Api::V1::PetsController < ApplicationController

  before_action :authorize_request, except: [:index]

  def index
    @pets =  Pet.where(:status => 1).page(params[:page]).per(4)
    data = Hash.new
    data[:pets] = @pets  
    data[:total_pages] = @pets.total_pages  
    render  json: data
  end

  def destroy
    pet = Pet.where(
      :id => params[:id],
      :user_id => @current_user.id
    )
    .first
    .destroy
  end

end
