class UsersController < ApplicationController

  def index
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
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:displayname, :email, :password)
    end

    def user
      @user ||= User.find params[:id]
    end


end
