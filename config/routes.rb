Rails.application.routes.draw do

  resources :course_offers do
    collection do
      post :addCourse
      delete :deleteCourse
    end
  end
  resources :stores do
    collection do
      post :addCourse
      post :updateGPA
      delete :deleteCourse
    end
  end
  resources :courses
  devise_for :users, :path => 'users'
  resources :users do
    resources :userdetails
  end

  resources :semesters do
    member do
      get 'getCourses'
      get 'getSemesterCourses'
    end
  end

  root 'pages#index'

  get 'profile', to: 'pages#profile'


  get '/users/:id' => 'pages#profile'

  get '/home' => 'pages#home'

  get '/explore' => 'pages#explore'

end
