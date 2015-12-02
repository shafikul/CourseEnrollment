Rails.application.routes.draw do

  resources :semesters do
    collection do
      get :getCourses
    end
  end
  resources :courses
  resources :dummies
  devise_for :users

  root 'pages#Index'

  get '/home' => 'pages#Home'

  get '/users/:id' => 'pages#Profile'

  get '/explore' => 'pages#Explore'

end
