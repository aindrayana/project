class SearchController < ApplicationController
  def index
    search_params = params.permit([:search])
    @search = search_params[:search]
    @blog = Post.where(["title ilike ? OR body ilike ?", "%#{@search}%", "%#{@search}%"]).order("created_at DESC")
    # render text: "search: #{@search} <br>path: #{request.env['PATH_INFO']}"
    # render text: "search: #{@search}"
  end

end
