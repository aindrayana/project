class CodesController < ApplicationController
  def index
    @codes = Code.all
  end
  def show
    @code = Code.find params[:id]
    # @snippets = Snippet.find
    # render text: params[:id]
  end

end
