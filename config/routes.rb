Rails.application.routes.draw do
  resources :trash_requests
  resources :items
  devise_for :users
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'trash_requests#new'


end
