Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: 'tops#index'
  
  resources :tops, only: [:index]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]

  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end
  
end
