Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  resources :patients, only: [:show] do

  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
