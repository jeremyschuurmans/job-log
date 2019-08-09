Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root                'static_pages#index'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/applications', to: 'applications#index'

  resources :users, except: [:index, :new, :create, :show, :destroy]

  resources :companies do
    resources :applications, except: [:index]
  end
end
