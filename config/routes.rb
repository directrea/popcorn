Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "movies#index"

  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  resources :movies, only: [:index,:show] do
    get 'search', on: :collection
    resources :performances, only: [] do
      resources :seats, only: [:index] do
        resources :reservations,only: [:show,:new,:create]
      end
    end
  end
  resources :members, only: [:new,:create]
  get "reservations" => "reservations#index"  
  resource :session, only: [:create, :destroy]
  resource :account
  resource :password, only: [:show, :edit, :update]

  namespace :admin do
    root "movies#index"
    get "reservations" => "reservations#index"
    resources :members
    resources :movies do
      get 'search','finished', on: :collection
      resources :performances, except: [:show,:edit] do
        resources :seats, only: [:index] do
          resources :reservations,only: [:show,:new,:create]
        end
      end
    end
  
  end
end
