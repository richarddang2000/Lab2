Rails.application.routes.draw do
  
  get 'hello_world/index'
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/delete'
  root 'demo#index'
  
  resources :books
  
  
  get 'demo/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  get 'demo/practice'
  #default route
  #get ':controller(/:action(/:id))' 

  get 'demo2/index2'  
  
  get 'demo/hello'

end
