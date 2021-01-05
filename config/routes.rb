Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

#use 'namespace' instead of 'scope' when wanting a route with a module that uses that module name for URL
  # scope '/admin', module: 'admin' do
  namespace :admin do
    resources :stats, only: [:index]
  end


  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  root 'posts#index'
end
