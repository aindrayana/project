Rails.application.routes.draw do
  root "codes#index"

  # resources :codes do
  #   collection do
  #     resources :snippets, only: [:new, :create]
  #   end
  #   resources :snippets, only: [:edit, :show, :update]
  # end

  resources :snippets, only: [:new, :create, :edit, :update]
  resources :codes do
    resources :snippets, only: [:show, :destroy]
  end

end
