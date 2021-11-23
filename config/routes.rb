Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :new]
  end 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
