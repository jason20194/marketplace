Rails.application.routes.draw do
  root 'market#homepage'
  devise_for :users

  get 'cards/:id', to: 'cards#show', as: "card"
  

  get 'market/homepage', to: 'market#homepage'
  get 'market/card/new', to: 'market#new'
  post 'market/card', to: 'market#create'
  get 'market/show/:id', to:'market#show', as:'market_show'
  
  get 'market/about', to: 'market#about'

  get 'market/buyorsell', to: 'market#buyorsell'

  get 'market/sold', to: 'market#sold'

  get 'market/contact', to: 'market#contact'

  get 'orders/index', to: 'orders#index'

  get 'listings/index', to: 'listings#index'

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


