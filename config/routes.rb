Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :foods do
      resources :recipe_foods
    end
    resources :recipes do
      resources :recipe_foods
    end
  end
  root to: 'users#index'

  post 'authenticate', to: 'authentication#authenticate'
  # Defines the root path route ("/")
  # root "articles#index"
end
