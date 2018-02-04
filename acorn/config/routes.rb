Rails.application.routes.draw do
  devise_for :members
  
  resources :events
  root to: "home#index"
end
