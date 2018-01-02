Rails.application.routes.draw do
  root 'landing#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, :controllers => { registrations: 'users/registrations', confirmations: 'users/confirmations' }
  resources :articles do
    member do
      post :contact
    end
  end

  get 'my_articles' => 'articles#my_articles'

  resources :password, only: [] do
    get 'edit', on: :collection
    patch 'update', on: :collection
  end

  resources :pages, only:[] do
    collection do
      get :terms
      get :policies
    end
  end

  resources :favorites, only: [:create, :destroy]
  get 'my_favorites' => 'favorites#my_favorites'

end
