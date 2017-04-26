Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  unauthenticated :user do
    devise_scope :user do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  authenticated :user do
    root to: 'rooms#index'
  end

  resources :rooms do
    resource :memberships
    resources :messages
  end
  resources :users
end
