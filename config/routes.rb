Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do

      get '/:model/find',     to: 'find#show'
      get '/:model/find_all', to: 'find#index'
      get '/:model/random',   to: 'random#show'

      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          # collection do
          #   get '/most_revenue'
          # end
          
          member do
            get '/items',    to: 'items#index'
            get '/invoices', to: 'invoices#index'
          end
        end
      end

      resources :customers, only: [:index, :show] do
        scope module: 'customers' do
          member do
            get '/invoices',     to: 'invoices#index'
            get '/transactions', to: 'transactions#index'
          end
        end
      end

      resources :items, only: [:index, :show] do
        scope module: 'items' do
          member do
            get '/invoice_items', to: 'invoice_items#index'
            get '/merchant',      to: 'merchants#show'
          end
        end
      end

      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          member do
            get '/transactions',  to: 'transactions#index'
            get '/invoice_items', to: 'invoice_items#index'
            get '/items',         to: 'items#index'
            get '/customer',      to: 'customers#show'
            get '/merchant',      to: 'merchants#show'
          end
        end
      end

      resources :invoice_items, only: [:index, :show] do
        scope module: 'invoice_items' do
          member do
            get '/invoice', to: 'invoices#show'
            get '/item',    to: 'items#show'
          end
        end
      end

      resources :transactions,  only: [:index, :show] do
        scope module: 'transactions' do
          member do
            get '/invoice', to: 'invoices#show'
          end
        end
      end

    end
  end
end
