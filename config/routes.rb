Rails.application.routes.draw do

  get '/recommendations', to: 'recommendations#index'
  get '/identifications', to: 'identifications#index'

  resources :users do
    member do
      get '/recommendation',    to: 'recommendations#show'
      post '/recommendation',   to: 'recommendations#create'
      patch '/recommendation',  to: 'recommendations#update'
      delete '/recommendation', to: 'recommendations#destroy'

      get '/identification',    to: 'identifications#show'
      post '/identification',   to: 'identifications#create'
      patch '/identification',  to: 'identifications#update'
      delete '/identification', to: 'identifications#destroy'
    end
  end
end
