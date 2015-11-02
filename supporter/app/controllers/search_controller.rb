class SearchController < ApplicationController
  def index
    search_params = params.permit([:search])
    @search = search_params[:search]
    # render text: "inside search #{params}<br>search: #{@search}"
    # render text: "inside search #{params[:id]}<br>current status: #{@status.status}<br>change to: #{status}"
    @contact = Contact.where(["name ilike :search_term OR
      email ilike :search_term OR
      message ilike :search_term", {search_term: "%#{@search}%"}]).order("created_at DESC")
  end
end
