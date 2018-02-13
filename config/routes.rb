Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]

  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource(
      :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update],
    )
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  resources :members, only: [:index, :show, :new, :create]

  resources :payments, only: [:index, :create] do
    collection do
      patch :update_statuses
    end
  end

  root to: "welcome#index"
end
