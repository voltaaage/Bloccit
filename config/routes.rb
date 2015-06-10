Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
    resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except: [:index] 
  end
  
  resources :posts do
    resources :comments, only: [:create]
  end

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  
  root to: 'welcome#index'


end
