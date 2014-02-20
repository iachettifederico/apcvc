Apcvc::Application.routes.draw do
  get "admin" => "admin#index"
  get "*some_page/admin" => "admin#index"

  root to: 'home#index'

  devise_for :admins

  resources :announcements
  resources :books
  resources :events
  resources :messages, only: [:new, :create]
  resources :events do
    get :poster
  end

  namespace :pages do
    get :about
    get :comision
    get :secretaries
    get :formacion
    get :institutional_life
    #get :tramas
  end

  namespace :load do
    post :books
    post :events
  end

end
