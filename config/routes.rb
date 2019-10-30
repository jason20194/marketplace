Rails.application.routes.draw do
  root 'market#homepage'
  devise_for :users
  get 'market/homepage', to: 'market#homepage'
  get 'market/index', to: 'market#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
