Rails.application.routes.draw do
  # Limitar uso de resources show
  resources :registros
  resources :nascores, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'registros#registrar', as: "home"


end
