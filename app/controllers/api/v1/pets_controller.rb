class Api::V1::PetsController < ApplicationController

  def index
  	@pets =  Pet.where(:status => 1).page(params[:page]).per(4)
    data = Hash.new
    data[:pets] = @pets  
    data[:total_pages] = @pets.total_pages  
    render  json: data
  end

end
