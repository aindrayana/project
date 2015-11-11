class SearchController < ApplicationController
  def index
    search_params = params.permit([:search])
    @search = search_params[:search]
    @page = 1
    @page = params[:page] if params.has_key?(:page)
    @blog = Post.where(["title ilike ? OR body ilike ?", "%#{@search}%", "%#{@search}%"]).order("created_at DESC")
    # render text: "search: #{@search} <br>path: #{request.env['PATH_INFO']}"


    # @page = 1
    # @page = params[:page] if params.has_key?(:page)
    # @blog = Post.paginate(:page => @page, :per_page => 5).order("created_at DESC")
    # search
    # if params.has_key?(:search)
    #   @search = params[:seach]
    #   @blog = Post.paginate(:page => @page, :per_page => 5).where(["title ilike ? OR body ilike ?", "%#{@search}%", "%#{@search}%"]).order("created_at DESC")
    # else
    #   @blog = Post.paginate(:page => @page, :per_page => 5).order("created_at DESC")
    # end
    # Post.where(["title ilike ? OR body ilike ?", '%umbria%', '%umbria%'])
    # Post.where(title ILIKE "%Second%")  # search field in db case-insensitive only postgresql
  end
end
