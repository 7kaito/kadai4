Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about"
  
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only:[:index, :show, :edit, :update] do
    get :following
    get :followed
  end
end
