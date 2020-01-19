Rails.application.routes.draw do
  scope "(:locale)", locale: /ru|en/ do
    resources :comments
    resources :articles
    resources :sections
    resources :user_profiles
    devise_for :users
    root "home_pages#index"
  end
  resources :comments
  resources :articles
  resources :sections
  resources :user_profiles
  #devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
