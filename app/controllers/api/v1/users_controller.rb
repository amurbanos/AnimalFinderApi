class Api::V1::UsersController < ApplicationController

  # login user using JTW pattern
  def login
    puts user_params.inspect
    user = User
      .where("email"  => user_params[:email])      
      .first 
    data = Hash.new
    if user&.authenticate(user_params[:password])
      data[:token] = JsonWebToken.encode(user_id: user.id)
      data[:user] = user
    else
      data[:token] = nil
      data[:user] = nil 
    end   
    render  json: data
  end

  # list my pets
  def index
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
