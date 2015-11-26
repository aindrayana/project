class UsersController < ApplicationController

  before_action :control_panel, only: [:index]

  def control_panel
    authenticate_user
    if @current_user
      unless @current_user.admin
        redirect_to root_path, notice: "Please login with Admin privileges!"
      end
    end
  end

  def index
    @admin_nav = true
    @user = User.new
    @page = 0
    @num = 0
    @page = params[:page] if params.has_key?(:page)
    if (@page!=0)
      @num = (@page.to_i - 1) * 10
    end
    @user = User.all.order("id DESC").page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    # render text: user_params
    # session[:return_to] ||= request.referer
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      # redirect_to session.delete(:return_to)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    user.destroy
    # redirect_to root_path
    redirect_to session.delete(:return_to)
  end

  def status
    @status = User.find params[:id]
    if @status.admin
      status = false
    else
      status = true
    end
    if @status.update({admin: status})
      # render text: "status updated!!"
      redirect_to users_path
    else
      render text: "status not updated!!"
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def user
      @user ||= User.find params[:id]
    end


end
