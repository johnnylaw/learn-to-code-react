Rails.application.routes.draw do
  get 'users/:username/todos' => 'todos#index'
  post 'users/:username/todos' => 'todos#create'
  patch 'users/:username/todos/:id' => 'todos#update'
  delete 'users/:username/todos/:id' => 'todos#destroy'
end
