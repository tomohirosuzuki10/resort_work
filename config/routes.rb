Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }
  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  
  resource :users, only: [:edit, :update, :unsubscribe, :withdraw] do
    collection do
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      put "mypage", :to => "users#update"
      # 退会確認画面
      get "unsubscribe", :to => 'users#unsubscribe'
     # 論理削除用のルーティング
      patch "withdraw", :to => 'users#withdraw'
    end
  end

  
end
