Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  
  get 'books/show'
  get 'books/index'
  get 'books/create'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
