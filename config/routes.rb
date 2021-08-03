Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Api 1.0  
  namespace :api do
    namespace :v1 do
      resources  :pets       
    end
  end
end