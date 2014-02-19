Apcvc::Application.routes.draw do
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

  resources :events

  get "admin" => "admin#index"

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
  # resources :news_items
  # resources :books
  #
end
