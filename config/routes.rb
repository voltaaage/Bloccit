Rails.application.routes.draw do
  get 'comments/create'

  devise_for :users
    resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end
  

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  
  root to: 'welcome#index'


end
