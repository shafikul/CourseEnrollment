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

  root 'pages#index'

  get '/admin' => 'admin#index'

  get '/users/:id' => 'pages#profile'

  get '/home' => 'pages#home'

  get '/explore' => 'pages#explore'

end
