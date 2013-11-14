Ticketee::Application.routes.draw do
  get "users/index"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  root to: "projects#index"
  resources :projects do
    resources :tickets
  end
  resources :users
end
