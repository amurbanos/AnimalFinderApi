class Api::V1::PetsController < ApplicationController

  def index
  	@pets =  Pet.all
    render  json: @pets, include: :image 
  end

end
