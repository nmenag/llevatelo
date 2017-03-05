Rails.application.routes.draw do
  root 'pages#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :pages, only:[] do
    get :about, on: :collection
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :articles

  get 'my_articles' => 'articles#my_articles'
end
