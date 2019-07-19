Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: 'home#index'

  namespace :api do

    get '/posts', to: 'posts#query'
    
    resource :ping, only: [:show] 

  end


end
