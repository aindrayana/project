class ProductsController < ApplicationController
  def index
    @q = Product.all
  end

  def new
    @q = Product.new
  end

  def create
    product_params = params.require(:product).permit([:title, :price, :desc]) #only allow permitted param, in this case title and body
    @q = Product.new(product_params)
    if @q.save
        redirect_to(root_path(@id))
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
end
