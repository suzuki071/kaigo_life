Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'

  # usersコントローラのルーティング
  resources :users do
    member do
      get :followings, :followers
    end
  end

  # relationshipsコントローラのルーティング
  resources :relationships, only: [:create, :destroy] do
    get :followings, on: :member
    get :followers, on: :member
  end

  # reportsコントローラのルーティング
  resources :reports, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
      get 'rank'
    end
  end

  # questionsコントローラのルーティング
  resources :questions, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :answers, only: [:create, :destroy]
  end

  # likesコントローラのルーティング
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  
  get 'inquiry/index' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'

end
