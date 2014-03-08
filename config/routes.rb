Apcvc::Application.routes.draw do
  get "admin" => "admin#index"
  get "*some_page/admin" => "admin#index"

  root to: 'home#index'

  devise_for :admins

  resources :announcements
  resources :books
  resources :events
  resources :messages, only: [:new, :create]
  resources :videos
  resources :events do
    get :poster
  end
  resources :essays do
    get :document
  end

  namespace :pages do
    get :about
    get :secretaries
    get :institutional_life
    get :tramas
  end

  get "/dir_comission"         => "dir_comission#index"
  get "/edit_dir_comission"    => "dir_comission#edit"
  post "/update_dir_comission" => "dir_comission#update"

  get "/training"         => "training#index"
  get "/edit_training"    => "training#edit"
  post "/update_training" => "training#update"

  namespace :load do
    post :books
    post :events
  end

end
