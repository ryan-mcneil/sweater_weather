Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/gifs', to: 'gifs#show'

      post '/users', to: 'users#create'
      post 'sessions', to: 'sessions#create'

      get 'favorites', to: 'favorites#index'
      post 'favorites', to: 'favorites#create'
      delete 'favorites', to: 'favorites#destroy'
    end
  end
end
