Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'blogs#top'
  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end

  resources :users
  
end
