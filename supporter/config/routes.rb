Rails.application.routes.draw do
  # resources :contacts

  root "contacts#index"
  get "/contacts" => "contacts#index"
  post "/contacts" => "contacts#create"
  get "/contacts/new" => "contacts#new", as: :new_contact
  get "/contacts/:id/edit" => "contacts#edit", as: :edit_contact
  get "/contacts/:id" => "contacts#show", as: :contact
  patch "/contacts/:id" => "contacts#update"
  delete "/contacts/:id" => "contacts#destroy"

  # UPDATE STATUS ROUTES
  # get "/comments" => "comments#index"
  get "/contacts/:id/status" => "contacts#status", as: :edit_status

  #SEARCH ROUTES
  # resources :search
  get "/search" => "search#index"
  # get "/search/:id" => "search#result", as: :search
  post "/search" => "search#index"

  # posts_path	GET	/posts(.:format)	posts#index
  # POST	/posts(.:format)	posts#create
  # new_post_path	GET	/posts/new(.:format)	posts#new
  # edit_post_path	GET	/posts/:id/edit(.:format)	posts#edit
  # post_path	GET	/posts/:id(.:format)	posts#show
  # PATCH	/posts/:id(.:format)	posts#update
  # DELETE	/posts/:id(.:format)	posts#destroy

  # get "/posts" => "posts#index"
  # post "/posts" => "posts#create"
  # get "/posts/new" => "posts#new", as: :new_post
  # get "/posts/:id/edit" => "posts#edit", as: :edit_post
  # get "/posts/:id" => "posts#show", as: :post
  # patch "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"

end
