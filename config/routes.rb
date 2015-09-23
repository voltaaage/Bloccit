Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  devise_for :users
    resources :users, only: [:update, :show, :index]
  
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
  end
  
  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

end
