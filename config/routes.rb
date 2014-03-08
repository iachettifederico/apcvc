Apcvc::Application.routes.draw do
  get "admin" => "admin#index"
  get "admin/settings" => "admin#settings", as: :admin_settings
  #get "admin/update_settings" => "admin#update", as: :update_settings
  get "*some_page/admin" => "admin#index"

  root to: 'home#index'

  devise_for :admins

  resources :settings
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

  get "/dir_comission"         => "dir_comission#index"
  get "/edit_dir_comission"    => "dir_comission#edit"
  post "/update_dir_comission" => "dir_comission#update"

  get "/training"         => "training#index"
  get "/edit_training"    => "training#edit"
  post "/update_training" => "training#update"

  get "/secretaries"         => "secretaries#index"
  get "/edit_secretaries"    => "secretaries#edit"
  post "/update_secretaries" => "secretaries#update"

  namespace :pages do
    get :about
    get :institutional_life
    get :tramas
  end

  namespace :load do
    post :books
    post :events
  end

end
