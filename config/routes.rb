Rails.application.routes.draw do
  resources :artists, only: [:new, :create, :index, :show]
end
