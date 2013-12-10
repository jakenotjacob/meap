Ticketee::Application.routes.draw do
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  root to: "projects#index"

  resources :projects do
    resources :tickets
  end

  resources :tickets do
    resources :comments
  end

  resources :users

  namespace :admin do
    root to: "base#index"
    resources :users do
      resources :permissions

      put "permissions", to: "permissions#set", as: "set_permissions"
    end
    resources :states do
      member do
        get :make_default
      end
    end
  end

  resources :files

end
