Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  resources :users, only: [:edit, :show, :index]
  resources :books, only: [:show, :index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'home/about' => "homes#about" , as: 'about'
end
