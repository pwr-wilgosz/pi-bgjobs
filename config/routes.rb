require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'
  resources :comments do
    get 'clear', on: :collection
    get 'public', on: :collection  end
  resources :articles
  get :contact, to: "application#contact"
  root 'articles#index'

end
