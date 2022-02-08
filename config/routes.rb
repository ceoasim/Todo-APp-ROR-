Rails.application.routes.draw do
  
  # Build in routes for devise
  # devise_for :users
  
  # Custom routes for devise
  devise_for :users, path:'', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Routing 
  get '/contact' , to: "root#contact"
  get '/about' , to: "root#about"
  # get '/index' , to: "root#index"
  
  # Api route
  get '/api' , to: "root#api"
  
  # Query parameters
  get '/user/:id' , to: "root#user"

  # POST Api
  post '/add' , to: 'root#add'

  # Delete Api
  delete '/deleteTask/:id' , to: 'root#deleteTask'

  # Update Api
  get '/update/:id' , to: 'root#update'

  # Update Form Api
  post '/updateForm' , to: 'root#updateForm'

  # Search Api
  get '/search' , to: 'root#search'

  # Exact path
  root "root#index"
end
