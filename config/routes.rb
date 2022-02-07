Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    collection do
      get 'search'
    end
    collection do
      get 'incre_search', to: 'tweets#incre_search'
    end
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
