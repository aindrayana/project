Rails.application.routes.draw do
  # resources :products

  # products_path	    GET	  /products(.:format)	products#index
  #                   POST	/products(.:format)	products#create
  # new_product_path	GET	  /products/new(.:format)	products#new
  # edit_product_path	GET	  /products/:id/edit(.:format)	products#edit
  # product_path	    GET	  /products/:id(.:format)	products#show
  #                   PATCH	/products/:id(.:format)	products#update
  #                   PUT	  /products/:id(.:format)	products#update
  #                   DELETE	/products/:id(.:format)	products#destroy

  # get "/products" => "products#index"
  # post "/products" => "products#create"
  # get "/products/new" => "products#new", as: :new_product
  # get "/products/:id/edit" => "products#edit", as: :edit_product
  # patch "/products/:id" => "products#update"
  # get "/products/:id" => "products#show", as: :product
  # delete "/products/:id" => "products#destroy"
  root "products#index"
  get "/" => "products#index"
  post "/" => "products#create", as: :products
  get "/new" => "products#new", as: :new_product
  get "/:id/edit" => "products#edit", as: :edit_product
  patch "/:id" => "products#update"
  get "/:id" => "products#show", as: :product
  delete "/:id" => "products#destroy"

  # get "/index" => "amazon#index"
  # root "amazon#index"
  # get "/index/id" => "amazon#index"
  # get({"/new" => "amazon#new", as: :new_product})
  # post({"/new" => "amazon#create", as: :products})
  # get "/edit/:id" => "amazon#edit", as: :edit_product
  # # get "/index/:id/edit" => "amazon#edit", as: :edit_product
  # patch "/index/:id" => "amazon#update"
  # # patch({"/questions/:id" => "questions#update"})
  # # get({"/questions/:id/edit" => "questions#edit", as: :edit_question})

end
