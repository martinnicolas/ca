Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :roles
  resources :reclamos
  resources :tipo_reclamos
  devise_for :users, :path => 'user'
  get 'index/index'
  get 'admin/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  get 'index' => 'index#index'
  get 'admin' => 'admin#index'
  get 'reclamos/:id/valorar' => 'reclamos#valorar', as: :valorar
  get 'reclamos/:id/quitar_valor' => 'reclamos#quitar_valor', as: :quitar_valor
  get 'admin/grafico_reclamos' => 'admin#grafico_reclamos', as: :grafico_reclamos

  #API routes
  post 'api_restv1/signin' => 'api_restv1#signin'
  post 'api_restv1/signup' => 'api_restv1#signup'
  get 'api_restv1/index' => 'api_restv1#index'
  get 'api_restv1/reclamos' => 'api_restv1#reclamos'
  get 'api_restv1/tipos_reclamo' => 'api_restv1#tipos_reclamo'
  post 'api_restv1/reclamos/:id/valorar' => 'api_restv1#valorar_reclamo'
  post 'api_restv1/reclamos' => 'api_restv1#crear_reclamo'
  put 'api_restv1/reclamos/:id' => 'api_restv1#actualizar_reclamo'
  delete 'api_restv1/reclamos/:id' => 'api_restv1#eliminar_reclamo'
end
