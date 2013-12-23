Ticketee::Application.routes.draw do
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  root to: "projects#index"

  resources :projects do
    resources :tickets do
      #'collection' as SEARCH action may act on a group of Tickets
      collection do
        get :search
      end
    end
  end

  resources :tickets do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
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
