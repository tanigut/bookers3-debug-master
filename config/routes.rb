Rails.application.routes.draw do

  devise_for :users

  root 'home#top'
  get 'home/about'
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
  #いいね機能
  resource :favorites, only: [:create, :destroy]
  #コメント機能
  resources :book_comments, only: [:create, :destroy]
  end

end