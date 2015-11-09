class SnippetsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def find_contact
    @snippet = Snippet.find params[:id]
    @codes = Code.all
  end

  def new
    @snippet = Snippet.new
    @codes = Code.all
  end

  def create
    snippet_params = params.require(:snippet).permit(:code_id, :title, :work)
    @snippet = Snippet.new snippet_params
    if @snippet.save
      redirect_to root_path, notice: "account created!"
    else
      render :new
    end
  end

  def show
    # render text: params[:id]
  end

  def edit

  end

  def update
    # render text: "inside update #{params}"
    # @contact = Contact.find params[:id]
    snippet_params = params.require(:snippet).permit(:code_id, :title, :work)
    if @snippet.update(snippet_params)
      # render text: "path: #{posts_path}"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @code = Code.find params[:code_id]
    @snippet.destroy
    redirect_to code_path(@code)
  end
end
