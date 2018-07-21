Rails.application.routes.draw do
  # Limitar uso de resources show
  resources :registros
  resources :nascores, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'registros#new', as: "home"
  get '/registro/admin', to: 'registros#admin', as: "admin"

end
