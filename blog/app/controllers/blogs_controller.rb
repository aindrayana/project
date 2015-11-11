class BlogsController < ApplicationController
  def index
    # @blog = Post.all.order("created_at DESC")

    # pagination
    @page = 1
    @page = params[:page] if params.has_key?(:page)
    @blog = Post.paginate(:page => @page, :per_page => 5).order("created_at DESC")
    # @blog = Post.all
  end
  def show
    @blog = Post.find(params[:id])
    # @comment_count = params[:id]
    # @comment_count = Comment.where(post_id: params[:id]).count
    # @comment = Comment.all.order("created_at DESC")
    # @comment = Comment.where(post_id: params[:id]).order("created_at DESC")
  end
end
