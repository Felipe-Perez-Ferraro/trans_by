Rails.application.routes.draw do
  root "splash#index"
  devise_for :users

  resources :groups do
    resources :operations
  end
end
