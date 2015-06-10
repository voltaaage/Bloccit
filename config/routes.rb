Rails.application.routes.draw do
  #get 'comments/create'

  get 'users/update'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  devise_for :users

  resources :users, only: [:update]
  
  # Removing automatic get statements above and replacing in favor of below
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create,:new]
    end
  end

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  #get 'comments' => '/topics/:topic_id/posts/:post_id/comments'

  root to: 'welcome#index'


end
