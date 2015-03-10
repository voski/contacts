Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index]
    member do
      get 'favorites'
    end

    resources :comments, only: [:index, :create]
  end
  resources :contacts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index, :create]
  end
  resources :contact_shares, only: [:destroy, :create] do
    member do
      get 'favorites'
    end
  end
end
