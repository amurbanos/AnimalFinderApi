require 'rails_helper'

describe Api::V1::PetsController, type: :controller do
  it 'index retorna 200' do
  	request.accept = 'application/json'
  	get :index
  	expect(response).to have_http_status(200)
  end
end