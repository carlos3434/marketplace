Rails.application.routes.draw do
  devise_for :users
  get :protected, to: 'visitors#protected'
  root 'visitors#index'
  #root to: ->(_) { [400, {}, ['']] }
  #resources :messages, only: [:index]
  get 'users/Authentication'
  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index create destroy]
      resources :items, only: %i[index create show update destroy]

      post 'login', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end