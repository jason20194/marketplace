Rails.application.routes.draw do
  root 'market#homepage'
  devise_for :users
  get 'cards/edit/:id', to: 'cards#edit'
  get 'market/homepage', to: 'market#homepage'
  get 'market/index', to: 'market#index'
  get 'market/card/new', to: 'market#new'
  post 'market/card', to: 'market#create'
  get 'market/show/:id', to:'market#show', as:'market_show'
  


  resources :cards do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

