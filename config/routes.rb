PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
  	resources :comments, shallow: true
  end
  

  resources :categories
end
