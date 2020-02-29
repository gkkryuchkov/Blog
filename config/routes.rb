Rails.application.routes.draw do
  class OnlyAjaxRequest
    def matches?(request)
      request.xhr?
    end
  end
  resources :about_mes
  get 'about' => 'about_mes#index'

  resources :comments do
    resources :comments
    put 'clear_content' => 'comments#clear_content'
    post 'rating_up' => 'comments#rating_up'
    post 'rating_down' => 'comments#rating_down'
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
