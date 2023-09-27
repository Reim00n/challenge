Rails.application.routes.draw do
  devise_for :usuarios, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  resources :subscribe_me, only: [:index] do
    post :enviar_email, on: :member
    get :index, on: :member
  end
  resources :respuesta, only: [:new, :create]
  get 'respuesta/complete', to: 'respuesta#complete'
  root to: 'admin/dashboard#index'
end
