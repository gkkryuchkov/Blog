Rails.application.routes.draw do
  class OnlyAjaxRequest
    def matches?(request)
      request.xhr?
    end
  end
  resources :about_mes do
    member do
      get 'about' => 'about_mes#index'
    end
  end

  resources :comments do
    resources :comments
  end
  resources :sections
  resources :user_profiles
  devise_for :users
  root "home_pages#index"
  resources :articles do
    resources :comments
    member do
      delete :delete_image
      get :deliver_image
      post 'add_to_favorite' => 'articles#add_to_favorite', constraint: OnlyAjaxRequest.new
      delete 'remove_from_favorite' => 'articles#remove_from_favorite', constraint: OnlyAjaxRequest.new
    end
  end
  get 'favorite_articles' => 'articles#favorite_articles'
  resources :sections
  #devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
