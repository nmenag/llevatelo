Rails.application.routes.draw do
  root 'pages#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :pages, only:[] do
    get :about, on: :collection
  end

  devise_for :users, :controllers => { registrations: 'users/registrations', confirmations: 'users/confirmations' }
  resources :articles

  get 'my_articles' => 'articles#my_articles'

  resources :password, only: [] do
    get 'edit', on: :collection
    patch 'update', on: :collection
  end

  resources :favorites, only: [:create, :destroy]
  get 'my_favorites' => 'favorites#my_favorites'
  
end
