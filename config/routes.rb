Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, except: %i[edit update]

  resources :recipes, except: %i[edit update] do
    resources :recipe_foods, only: %i[new create destroy]
  end

  # root to: 'foods#index'
  root to: 'recipes#index'
  get '/general_shopping_list', to: 'foods#general'
  get '/public_recipe', to: 'recipes#public'
  # post 'authenticate', to: 'authentication#authenticate'
  # Defines the root path route ("/")
  # root "articles#index"
end
