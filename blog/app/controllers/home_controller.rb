class HomeController < ApplicationController
  def index

  end
  def blogs
    # @blog = Post.all.order("created_at DESC")

    # pagination
    @page = 1
    @page = params[:page] if params.has_key?(:page)
    @blog = Post.paginate(:page => @page, :per_page => 5).order("created_at DESC")

  end
  def view
    @blog = Post.find(params[:id])
    # @comment_count = params[:id]
    @comment_count = Comment.where(postid: params[:id]).count
    # @comment = Comment.all.order("created_at DESC")
    @comment = Comment.where(postid: params[:id]).order("created_at DESC")
  end
end
