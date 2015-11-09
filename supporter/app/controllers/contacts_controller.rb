class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]
  ## ------
  def find_contact
    @contact = Contact.find params[:id]
  end
  def contact_params
    contact_params = params.require(:contact).permit([:name, :email, :deparment, :message, :status])
  end
  ## ------

  def index
    # render text: "index page"
    # @contact = Contact.all.order("status DESC")

    # pagination
    @page = 0
    @num = 0
    @page = params[:page] if params.has_key?(:page)
    if (@page!=0)
      @num = (@page.to_i - 1) * 10
    end
    # @contact = Contact.paginate(:page => @page, :per_page => 5).order("created_at DESC")
    @contact = Contact.order("status DESC").page(params[:page]).per(10)
    # @contact = Contact.order("name").page(params[:page]).per(5)
    # @users = User.order(:name).page params[:page]

  end
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
        redirect_to(contacts_path)
    else
        render :new
    end
  end
  def show
    # @contact = Contact.find(params[:id])
  end
  def edit
    # @contact = Contact.find(params[:id])
  end
  def update
    # render text: "inside update #{params}"
    # @contact = Contact.find params[:id]
    if @contact.update(contact_params)
      # render text: "path: #{posts_path}"
      redirect_to contacts_path
    else
      render :edit
    end
  end
  def destroy
    # @contact = Post.find params[:id]
    @contact.destroy
    redirect_to contacts_path
  end

  def status
    @status = Contact.find params[:id]
    if @status.status == 0
      status = 1
    else
      status = 0
    end
    if @status.update({status: status})
      # render text: "status updated!!"
      redirect_to contacts_path
    else
      render text: "status not updated!!"
    end
    # render text: "inside update #{params[:id]}<br>current status: #{@status.status}<br>change to: #{status}"

    # q.update({view_count:100, title: "hello world"})
  end

  def search_term
    # search_params = params.permit([:search])
    # @search = search_params[:search]
    # render text: "inside search #{params[:id]}<br>current status: #{@status.status}<br>change to: #{status}"
    # @contact = Contact.where(["name ilike :search_term OR
    #   email ilike :search_term OR
    #   message ilike :search_term", {search_term: "%#{@search}%"}]).order("created_at DESC")
  end

end
