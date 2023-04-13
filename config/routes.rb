Rails.application.routes.draw do
  get 'static/home'
  resources :support_chats, only: [ :create, :show, :index, :new ] do
    resources :messages, only: [ :create, :show ]
  end
  resources :sessions, except: [ :update, :show, :index, :edit, :destroy ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static#home"
end
