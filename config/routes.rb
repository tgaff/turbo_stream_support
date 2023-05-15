Rails.application.routes.draw do
  resources :support_chats do
    resources :messages, only: [:create]
  end
  get 'static/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static#home"
end
