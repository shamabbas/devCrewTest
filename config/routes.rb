Rails.application.routes.draw do

  # default devise omniauth callback
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :teams # CRUD Teams routes
  resources :monsters # CRUD monsters routes
  # Social media integration routes
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  # set root path
  root 'dashboard#index'
  # error response pages
  get '*path' => redirect('/')
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#server_error'

  # API+API Documentation
  # mount GrapeSwaggerRails::Engine => '/apidoc'
  mount Devcrew::Request => '/api'
  # API routes
  # namespace :api do
  #   namespace :dev_crew do
  #     resources :monsters do
  #       collection do
  #         get :index
  #         post :create_monster
  #         delete :delete_monster
  #         put :update_monster
  #       end
  #     end
  #   end
  # end
end
