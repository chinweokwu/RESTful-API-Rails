Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index create destroy]
      resources :books, only: %i[index create show update destroy]
      post 'login', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end
