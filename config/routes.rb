Rails.application.routes.draw do
  root to: redirect('/menu')
  get 'session/index'
  get 'session/new'
  post 'session/create'
  get 'session/destroy'

  get 'menu', to: 'menu#index'
  resources :products

end
