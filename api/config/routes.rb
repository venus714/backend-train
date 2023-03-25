Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #user
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  delete '/users/logout', to: 'users#logout'

  #todos
  post '/todos', to: 'todos#create'

  #update todos
  put '/todos/:id', to: 'todos#update'
  #delete todos
  delete '/todos/:id', to: 'todos#destroy'
  #view all todos
  get '/todos', to: 'todos#index'



  get '/user/login/check', to: 'users#check_login_status'

end
