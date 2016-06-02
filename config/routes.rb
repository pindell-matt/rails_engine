Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/:model/find',     to: 'find#show'
      get '/:model/find_all', to: 'find#index'
      get '/:model/random',   to: 'random#show'
    end
  end

  namespace :api do
    namespace :v1, defaults: { format: :json } do

      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          member do
            get '/items',    to: 'items#index'
            get '/invoices', to: 'invoices#index'
          end
        end
      end

      resources :customers, only: [:index, :show]
      resources :items,     only: [:index, :show]
      resources :invoices,  only: [:index, :show]
    end
  end
end
