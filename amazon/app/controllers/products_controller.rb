class ProductsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @limit = 10
    @page = 1
    @page = params[:page].to_i if (params[:page])
    @total_pages = (Product.count/@limit).ceil
    @offset = @limit * (@page-1)
    @q = Product.all.limit(@limit).offset(@offset)

    # kaminari
    # @q = Product.order("id desc").page(@page).per(@limit)
  end

  def new
    @q = Product.new
  end

  def create
    product_params = params.require(:product).permit([:title, :price, :desc]) #only allow permitted param, in this case title and body
    @q = Product.new(product_params)
    @q.user = current_user
    if @q.save
        redirect_to(root_path)
    else
        render :new # this will render views/products/new.html.erb
    end
  end

  def edit
    @q = Product.find(params[:id])
    # render text: "inside update #{params}"
  end
  def update
    @q = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :price, :desc])
    if @q.update(product_params)
      redirect_to root_path(@q)
    else
      render :edit
    end
    # render text: "inside update #{params}"
  end
  def destroy
    @q = Product.find params[:id]
    # render text: @q
    @q.destroy
    redirect_to root_path
  end

  def show
    @q = Product.find params[:id]
    # @comment = Comment.new
    # @comments = Comment.where(product_id: params[:id])

    # SELECT * FROM products LIMIT 10 OFFSET 31
  end
end
