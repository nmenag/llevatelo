Rails.application.routes.draw do
  root 'pages#index'
  resources :pages, only:[] do
    get :about, on: :collection
  end
  
  devise_for :users
  resources :articles
end
