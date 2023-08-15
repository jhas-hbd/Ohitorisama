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

   # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
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
      resources :days, except: [:show, :index]
        # resources :schedules, except: [:show, :index]
      # end
    end

    resources :days, except: [:show, :index] do
      resources :schedules, except: [:show, :index]
    end

    get "search" => "searches#search"
    get "tag_search" => "searches#tag_search"
  end

  #管理者側のルーティング設定
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :plans, only: [:index, :show] do
      member do
        get "individual"
      end
      collection do
        get "comment"
      end
      resources :comments, only: [:destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
