Rails.application.routes.draw do
  root "pages#home", as: :home

  controller :pages do
    get :contact
    get :paintings
  end
end
