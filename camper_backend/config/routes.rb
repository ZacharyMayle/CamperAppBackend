Rails.application.routes.draw do
  resources :parks
  resources :user_campgrounds
  resources :campgrounds
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
