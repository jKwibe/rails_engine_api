Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/', to: 'merchants#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_items', to: 'most_items#index'
        get '/most_revenue', to: 'most_items#show'
        get '/:id', to: 'merchants#show'
        get '/:id/revenue', to: 'revenue#show'
        post '/', to: 'merchants#create'
        patch '/:id', to: 'merchants#update'
        delete '/:id', to: 'merchants#destroy'

        get '/:id/items', to: 'items#index'
      end

      namespace :items do
        get '/', to: 'items#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id', to: 'items#show'
        post '/', to: 'items#create'
        patch '/:id', to: 'items#update'
        delete '/:id', to: 'items#destroy'

        get '/:id/merchant', to: 'merchant#index'
      end

      get '/revenue', to: 'merchants/revenue#index'
    end
  end
end
