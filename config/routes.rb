Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  post 'post/:post_id/comments', to: 'comments#create', as: 'post_comment'
  resources :posts
end
