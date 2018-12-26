Rails.application.routes.draw do

  get '/recommendations', to: 'recommendations#index'

  resources :users do
    member do
      get '/recommendation',    to: 'recommendations#show'
      post '/recommendation',   to: 'recommendations#create'
      patch '/recommendation',  to: 'recommendations#update'
      delete '/recommendation', to: 'recommendations#destroy'
    end
  end
end
