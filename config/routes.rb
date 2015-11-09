Rails.application.routes.draw do
  root "pages#home", as: :home

  controller :pages do
    get :contact
    get :paintings
  end

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :paintings, only: [:index, :edit, :create, :update, :destroy]
  end
end
