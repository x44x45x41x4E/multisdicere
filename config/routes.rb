Rails.application.routes.draw do

  unauthenticated :user do
  devise_scope :user do
    root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  authenticated :user do
    root to: 'home#index'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
