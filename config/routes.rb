Rails.application.routes.draw do
  resources :scratches
  resources :tasks
  resources :task_groups
  resources :days
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
