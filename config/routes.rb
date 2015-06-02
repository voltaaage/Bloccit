Rails.application.routes.draw do
  get 'users/update'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  devise_for :users

  resources :users, only: [:update]
  
  # Removing automatic get statements above and replacing in favor of below
  resources :topics do
    resources :posts, except: [:index]
  end
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'


end
