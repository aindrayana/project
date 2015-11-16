class IdeasController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  # before_action :authorize, only: [:edit, :update, :destroy]
  before_action :idea, only: [:show, :edit, :update, :destroy]


  def index
    @page = 0
    @num = 0
    @page = params[:page] if params.has_key?(:page)
    if (@page!=0)
      @num = (@page.to_i - 1) * 10
    end
    @ideas = Idea.all.order("id DESC").page(params[:page]).per(10)
  end

  def new
    @ideas = Idea.new
  end

  def create
    @ideas = Idea.new(idea_params)
    @ideas.user = current_user
    if @ideas.save
      redirect_to(root_path, notice: "Question created!")
    else
      flash.now[:alert] = 'Error while sending message!'
      render :new
    end
  end

  def show
    # if (current_user.nil?)
    #   @ideas.view_count += 1
    #   @ideas.save
    # elsif (@ideas.user.displayname != current_user.displayname)
    #   @ideas.view_count += 1
    #   @ideas.save
    # end
    @comment = Comment.new
    @join_member = idea.joins.map(&:user_id)
    @join_member.push idea.user_id
    @join_member = User.where(id: [@join_member])
  end
  def edit
    redirect_to root_path, alert: "Access denied." unless can? :edit, @ideas
  end
  def update
    if @ideas.update(idea_params)
      redirect_to idea_path(@ideas), notice: "Idea updated!"
    else
      render :edit
    end
  end
  def destroy
    @ideas.destroy
    flash[:notice] = "Idea deleted successfully"
    redirect_to ideas_path
  end

  def idea
    @ideas ||= Idea.find params[:id]
  end
  def idea_params
    params.require(:idea).permit([:title, :body])
  end


end
