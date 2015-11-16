Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root "ideas#index"
  resources :users, except: [:show, :edit, :update]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :ideas do
    resources :comments
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]
  end

end
