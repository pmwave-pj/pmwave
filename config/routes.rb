Rails.application.routes.draw do
  #アプリケーションのルートディレクトリのページを決定
  #root to: "tasks#index"
  root to: "sessions#new"
  resources :users, only: [:index, :show, :new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  #Tasksコントローラーの7つのアクションを作成する
  #resources :tasks do
  resources :trn_task_details do
    member do
      #一覧画面 完了ボタン押下時のアクション
      get "kanryo"
    end
  end
  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  match 'taskdetail', to: 'trntaskdetails#index', via: 'get'

end