class BlogsController < ApplicationController
  before_action :blog, only: [:show]

  def index
    # paging ------------------
    @per_page = 5
    @page = 1
    # @num = 0
    @page = params[:page] if params.has_key?(:page)


    # if (@page!=0)
    #   @num = (@page.to_i - 1) * 10
    # end
    # end paging -------------
    @blogs = Post.all.order("id DESC").page(params[:page]).per(@per_page)
    # @total_pages = (@blogs.count / @per_page.).ceil
    # @blog = Post.paginate(:page => @page, :per_page => 5).order("created_at DESC")
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
