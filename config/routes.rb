Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :controlled_vocabs
  get 'collections/:id/export_metadata', to: 'hyrax/collections#export_metadata', as: 'export_metadata_collection'
  get 'dashboard/admin_metadata_export', to: 'dashboard#admin_metadata_export', as: 'admin_metadata_export'
  resources :batch_imports, only: [:new, :create], controller: 'batch_imports'
  mount Blacklight::Engine => '/'
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'users/auth/cas', to: 'users/omniauth_callbacks#passthru', as: 'new_user_session'
  devise_scope :user do
    get 'sign_in', to: redirect('users/auth/cas')
    get 'sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  mount Hydra::RoleManagement::Engine => '/'

  mount Qa::Engine => '/authorities'
  resources :welcome, only: 'index'
  root 'hyrax/homepage#index'
  curation_concerns_basic_routes
  curation_concerns_embargo_management
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end
  
  mount Hyrax::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
