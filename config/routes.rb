Rails.application.routes.draw do


  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
