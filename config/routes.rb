Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope :module => :web, :my_namespace => :web do
    # home page
    root 'pages#home'

    devise_for :users, :path => :account, :controllers => {
      :passwords => 'web/devise/passwords',
      :sessions => 'web/devise/sessions',
      :unlocks => 'web/devise/unlocks'
    }

    resources :users, :only => %w(show edit update)
    resources :categories
    resources :primers
    resources :positions
    post 'positions/calculate' => 'positions#calculate'

    resources :position_photos, :only => %w(create destroy)
    patch '/position_photos' => 'position_photos#create'

    get '400' => 'pages#error_400'
    get '404' => 'pages#error_404'
  end

  namespace :api, :my_namespace => :api, :defaults => {:format => :json} do
    only = %w(index show)

    namespace :v1, :my_namespace => 'api/v1', :constraints => ApiVersion.new(1) do
      resources :categories
      resources :genetic_markers, :only => only
      resources :useful_types, :only => only
      resources :primers, :only => only
      resources :positions, :only => only do
        resources :experiments, :only => only
      end

      get '400' => 'pages#error_400'
      get '404' => 'pages#error_404'
      match '*path' => 'pages#error_404', :via => :all unless Rails.env.development?
    end

    namespace :v2, :my_namespace => 'api/v2', :constraints => ApiVersion.new(2) do
      resources :categories
      resources :genetic_markers, :only => only
      resources :useful_types, :only => only
      resources :primers, :only => only
      resources :position_photos, :only => only
      resources :positions, :only => only do
        resources :experiments, :only => only
      end

      match '*path' => 'pages#error_404', :via => :all unless Rails.env.development?
    end
  end

  match '*path' => 'web/pages#error_404', :via => :all unless Rails.env.development?
end
