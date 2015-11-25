class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :control_panel
  # before_action :authorize, only: [:edit, :update, :destroy]
  before_action :post, only: [:show, :edit, :update, :destroy]

  # ----------------------------------------------------------------------------
    def authorize
      # redirect_to root_path, notice: "Access denied!" unless can? :manage, @post
    end
    def post
      @post ||= Post.find params[:id]
    end
    def post_params
      params.require(:post).permit([:title, :body])
      # params.require(:post).permit([:title, :body, {tag_ids: []}])
    end
    def control_panel
      @admin_nav = true
      authenticate_user
      if @current_user
        unless @current_user.admin
          redirect_to root_path, notice: "Please login with Admin privileges!"
        end
      end
    end
  # ----------------------------------------------------------------------------

  def index
    @page = 0
    @num = 0
    @page = params[:page] if params.has_key?(:page)
    if (@page!=0)
      @num = (@page.to_i - 1) * 10
    end
    @post = Post.all.order("id DESC").page(params[:page]).per(10)
  end

  def new
    @post = Post.new
    # render text: "inside new post"
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to(post_path(@post), notice: "Post created!")
    else
      render :new
    end
  end

  def show

  end

  def edit
    redirect_to root_path, alert: "Access denied." unless can? :edit, @post
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post updated!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post deleted successfully"
    redirect_to posts_path
  end

end
