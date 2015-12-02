Rails.application.routes.draw do

  devise_for :users

  root 'pages#Index'

  get '/home' => 'pages#Home'

  get '/users/:id' => 'pages#Profile'

  get '/explore' => 'pages#Explore'

end
