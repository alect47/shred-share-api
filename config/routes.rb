Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/events', to: 'events#index'
      get '/events/:id', to: 'events#show'
      post '/events', to: 'events#create'
      patch '/events/:id', to: 'events#update'
      delete '/events/:id', to: 'events#destroy'
    end
  end
end
