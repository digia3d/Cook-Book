Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, except: %i[edit update]

  resources :recipes, except: %i[edit update]

  #root to: 'foods#index'
  root to: 'recipes#index'

  # post 'authenticate', to: 'authentication#authenticate'
  # Defines the root path route ("/")
  # root "articles#index"
end
