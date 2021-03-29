Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :destroy, :show, :edit, :update] do
#    resources :orders, only: [:index]
  end
end
