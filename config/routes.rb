Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'static_pages#index'
  get '/signup', to: 'static_pages#signup'
  get '/login', to: 'static_pages#login'
end
