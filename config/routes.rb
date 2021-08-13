Rails.application.routes.draw do
  get 'inquiry/index'
  post 'inquiry/confirm'
  post 'inquiry/thanks'
  devise_for :users, controllers: {registrations: 'users/registrations',sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'

  # usersコントローラのルーティング
  resources :users, only: [:show, :edit, :update]

  # reportsコントローラのルーティング
  resources :reports, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end

  # questionsコントローラのルーティング
  resources :questions, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :answers, only: [:create, :destroy]
  end

end
