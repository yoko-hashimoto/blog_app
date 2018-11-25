Rails.application.routes.draw do
  root to: 'blogs#top'
  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end
end
