class PostsController < ApplicationController

  before_action :control_panel
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def find_post
    @post = Post.find params[:id]
  end

  def control_panel
    authenticate_user
    if @current_user
      unless @current_user.admin
        redirect_to blogs_path, notice: "Please login with Admin privileges!"
      end
    end
  end


  def index
    @post = Post.all.order("created_at DESC")
    #   @post = Post.all.order("created_at DESC")
    # else
    #   redirect_to blogs_path
    # end
    # render text: @current_user.inspect
    # render text: authenticate_user.inspect
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
        redirect_to(posts_path)
    else
        render :new
    end
  end
  def show
    # @post = Post.find(params[:id])
  end
  def edit
    # @post = Post.find(params[:id])
  end
  def update
    # render text: "inside update #{params}"
    # @post = Post.find params[:id]
    if @post.update(post_params)
      # render text: "path: #{posts_path}"
      redirect_to posts_path
    else
      render :edit
    end
  end
  def destroy
    # @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    post_params = params.require(:post).permit([:title, :body])
  end

end
