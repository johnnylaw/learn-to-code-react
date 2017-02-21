Rails.application.routes.draw do
  resources :users, only: [] do
    resources :todos, only: [:index, :create, :update]
  end
end
