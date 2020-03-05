Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      
      resources :users, only: [:create, :show, :index]

      get '/events', to: 'events#index'
      get '/events/:id', to: 'events#show'
      post '/events', to: 'events#create'
      patch '/events/:id', to: 'events#update'
      delete '/events/:id', to: 'events#destroy'
    end
  end
end
