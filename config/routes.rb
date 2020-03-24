Rails.application.routes.draw do
  root "homes#top"
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
  	resource :post_comments, only: [:create]
  	resource :likes, only: [:create, :destroy]
  end

  get "posts_runk" => "posts#runk_index", as: "runk_posts"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
