Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:show, :edit, :update] do
      member do
        get "unsubscribe"
        patch "withdraw"
      end
      
      collection do
        get "bookmark"
      end
      
      resource :relationships, only: [:create, :destroy]
      get "follows" => "relationships#follows"
      get "followers" => "relationships#followers"
    end
    resources :plans do
      member do
        get 'check'
      end
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      resources :days, except: [:show, :index]do
        resources :schedules, except: [:show, :index]
      end
    end
  end

  #管理者側のルーティング設定
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :plans, only: [:index, :show] do
      member do
        get "individual"
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
