Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/science', to: 'pages#science', as: :science
  get '/fun', to: 'pages#fun', as: :fun
  get '/art', to: 'pages#art', as: :art
  get '/porn', to: 'pages#porn', as: :porn
  get '/spirituality', to: 'pages#spirituality', as: :spirituality
  get '/wtf', to: 'pages#wtf', as: :wtf
end
