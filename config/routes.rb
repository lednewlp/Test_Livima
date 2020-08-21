Rails.application.routes.draw do
  resources :occupations
  devise_for :admins
  root 'lists#index'

  resources :lists do
    get :search, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
