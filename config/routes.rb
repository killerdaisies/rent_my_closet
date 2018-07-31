Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items
      resources :bookings
      resources :users
      post '/login', to: 'login#login'

    end
  end
end
