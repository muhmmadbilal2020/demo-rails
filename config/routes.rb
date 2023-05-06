Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/login', to: 'home#login'
  delete '/logout', to: 'home#logout'
  post '/signup', to: 'home#signup'

  post '/add-student', to: 'home#add_student'
  get '/student-list', to: 'home#student_list'
  get '/student-name-age', to: 'home#student_name_age'
  get '/student-sex-city', to: 'home#student_sex_city'

end
