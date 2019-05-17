Rails.application.routes.draw do
  get 'vue/index'

  resources :appls

  #ホーム画面
  get "static_pages/home"

  #共通画面（ヘッダー、フッター、メニュー）
  get "static_pages/common"

  #システム管理者
  #mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  #初期表示画面指定
  root "static_pages#home"

  #DEVICE設定
  devise_for :users, :controllers => {
                       :registrations => "users/registrations",
                       :sessions => "users/sessions",
                     }

  devise_scope :user do
    #ログイン
    get "sign_in", :to => "users/sessions#new"
    #ログアウト
    get "sign_out", :to => "users/sessions#destroy"
    #アカウント作成
    get "sign_up", :to => "users/registrations#new"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 確認ページ
  resources :appls do
    collection do
      post "confirm"
    end
  end

  # ユーザー管理ページ
  resources :users do
    collection do
      post "confirm"
    end
  end

  #エラーページ
  get "*path", controller: "application", action: "render_403"
  get "*path", controller: "application", action: "render_404"
  get "*path", controller: "application", action: "render_500"

  get "vue/index", controller: "vue", action: "index"
end
