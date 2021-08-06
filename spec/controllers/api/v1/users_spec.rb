require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  it 'login post' do
    request.accept = 'application/json'
    post :login, :params => { 
      user: {
        email: 'am.urbano@hotmail.com', 
        password: '123456' 
      }
    }
    expect(response).to have_http_status(200)
  end
end