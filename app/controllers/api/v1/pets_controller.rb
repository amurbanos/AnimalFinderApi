class Api::V1::PetsController < ApplicationController

  before_action :authorize_request, except: [:index, :update]

  # paginacao animais desaparecidos
  def index
    @pets =  Pet.where(:status => 1).order(:created_at => :desc).page(params[:page]).per(4)
    data = Hash.new
    data[:pets] = @pets  
    data[:total_pages] = @pets.total_pages  
    render  json: data
  end

  # cadastro de animal
  # POST /pets
  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = @current_user.id
    @pet.status = 1
    if @pet.save
      render json: @pet, status: :created
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # apenas dono do pet pode excluir
  # DELETE /pets/:id
  def destroy
    pet = Pet.where(
      :id => params[:id],
      :user_id => @current_user.id
    )
    .first
    .destroy
  end

  # Seta animal como encontrado
  # PATCH /pets/found/:id
  def found
    @pet = Pet.find(params[:id])
    @pet.status = 3
    if @pet.save
      render json: @pet, status: :created
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end  

  # PATCH /pets/fount/:id
  def update
    @pet = Pet.find(params[:id])
    @pet.status = 2
    @pet.information = @pet.information.to_s + " Notificado por: " + pet_params[:information]
    if @pet.save
      render json: @pet, status: :created
    else
      render json: @pet.errors, status: :unprocessable_entity
    end    
  end

  # adiciona e recorta a imagem
  def set_image
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :age, :state, :city, :information)
    end

end
