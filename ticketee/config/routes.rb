Ticketee::Application.routes.draw do
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  root to: "projects#index"
  resources :projects do
    resources :tickets
  end
  resources :users
end
