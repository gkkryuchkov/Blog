Rails.application.routes.draw do
  scope "(:locale)", locale: /ru|en/ do
    resources :comments
    resources :articles
    resources :sections
    resources :user_profiles
    devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
    root "home_pages#index"
  end
  resources :comments
  resources :articles
  resources :sections
  resources :user_profiles
  #devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
