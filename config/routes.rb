Apcvc::Application.routes.draw do
  get "admin" => "admin#index"
  get "*some_page/admin" => "admin#index"
  resources :announcements

  devise_for :admins
  resources :events

  root to: 'home#index'

  namespace :pages do
    get :about
    get :comision
    get :secretaries
    get :formacion
    get :institutional_life
    get :tramas
  end

  resources :messages, only: [:new, :create]

  resources :events do
    get :poster
  end

  # get "/jornada25" => "pages#jornada25"
  # namespace(:admin){ resources :books }
  #
  # namespace :admin do
  #   root to: "admin#index"
  #   resources :books
  #   resources :events
  #   resources :news_items
  #
  #   %W[books events].each do |model|
  #     post "import_#{model}_from_csv" => "#{model}#import_from_csv"
  #   end
  #
  # end
  #
  # resources :books
  #
end
