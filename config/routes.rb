Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]
  get '/about', to: "pages#about"
  get '/contact', to: "pages#contact"
  get '/test', to: "pages#test"
end
