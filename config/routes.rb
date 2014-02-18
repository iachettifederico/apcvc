Apcvc::Application.routes.draw do
  root to: 'home#index'

  namespace :pages do
    get :about
    get :comision
    get :secretaries
    get :formacion
    get :institutional_life
    get :tramas
  end

  match "/404", to: "errors#404", via: 'get'
  match "/422", to: "errors#404", via: 'get'
  match "/500", to: "errors#500", via: 'get'

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
  # resources :events
  # resources :books
  # resources :messages
  #
end
