Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :posts do
    collection do
      post :confirm
    end
    resources :likes, only: [:create, :destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
