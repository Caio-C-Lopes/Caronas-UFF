Rails.application.routes.draw do
  resources :caronas
  resources :campi do
    member do
      patch :activate
      patch :deactivate
    end

    collection do
      get :search
    end

  end
  get 'welcome/index'
  root to: 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
