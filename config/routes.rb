Rails.application.routes.draw do

  resources :course_offers
  resources :stores do
    collection do
      post :addCourse
      post :updateGPA
      delete :deleteCourse
    end
  end
  resources :courses
  devise_for :users

  resources :semesters do
    member do
      get 'getCourses'
    end
  end

  root 'pages#Index'

  get '/admin' => 'admin#index'

  get '/users/:id' => 'pages#Profile'

  get '/home' => 'pages#Home'

  get '/explore' => 'pages#Explore'

end
