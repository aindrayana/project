class BlogsController < ApplicationController
  before_action :blog, only: [:show]

  def index
    @page = 0
    @num = 0
    @page = params[:page] if params.has_key?(:page)
    if (@page!=0)
      @num = (@page.to_i - 1) * 10
    end
    @blogs = Post.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
    # @blog = Post.find(params[:id])
    @comment = Comment.new

    # @comment_count = params[:id]
    # @comment_count = Comment.where(post_id: params[:id]).count
    # @comment = Comment.all.order("created_at DESC")
    # @comment = Comment.where(post_id: params[:id]).order("created_at DESC")
  end

  def blog
    @blog ||= Post.friendly.find params[:id]
  end

end
