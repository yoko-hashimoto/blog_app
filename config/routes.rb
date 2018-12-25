Rails.application.routes.draw do

  root to: 'blogs#top'
  
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
