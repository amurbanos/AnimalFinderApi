class Api::V1::UsersController < ApplicationController

  before_action :authorize_request, except: [:login, :create]

  # login user using JTW pattern
  # POST /login
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
    render json: data
  end

  # dados do usuario e lista de pets relacionados
  # GET /users
  def index
    @user = User.find(@current_user.id)
    render json: @user
  end

  # cadastro de usuario
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone)
    end

end
