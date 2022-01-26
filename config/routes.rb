Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  post 'post/:post_id/comments', to: 'comments#create', as: 'post_comment'
  get 'posts/ditum/:id', to: 'posts#ditumner', as: 'post_views'
  resources :posts
end
