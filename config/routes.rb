Rails.application.routes.draw do
  
  
  root :to => 'tops#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  
  resources :users, only: [:show,:edit, :update, :unsubscribe, :withdraw] do
    collection do
      # 退会確認画面
      get "unsubscribe", :to => 'users#unsubscribe'
     # 論理削除用のルーティング
      patch "withdraw", :to => 'users#withdraw'
    end
  end

  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
 
 resources :posts do
   resource :favorites, only: [:create, :destroy]
   resources :comments, only: [:create, :destroy]
end
get "search" => "searches#search"
  
end
