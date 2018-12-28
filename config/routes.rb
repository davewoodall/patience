Rails.application.routes.draw do

  root 'users#index'

  get '/recommendations', to: 'recommendations#index'
  get '/identifications', to: 'identifications#index'

  resources :users do
    member do
      get '/recommendation',    to: 'recommendations#show'
      get '/edit_recommendation', to: 'recommendations#edit', as: :edit_recommendation
      get '/new_recommendation', to: 'recommendations#new', as: :new_recommendation
      post '/recommendation',   to: 'recommendations#create'
      patch '/recommendation',  to: 'recommendations#update'
      delete '/recommendation', to: 'recommendations#destroy'

      get '/identification',    to: 'identifications#show'
      get '/edit_identification', to: 'identifications#edit', as: :edit_identification
      get '/new_identification', to: 'identifications#new', as: :new_identification
      post '/identification',   to: 'identifications#create'
      patch '/identification',  to: 'identifications#update'
      delete '/identification', to: 'identifications#destroy'
    end
  end
end
