class SessionsController < ApplicationController
  def new
  end

  def create
    session[:return_to] ||= request.referer

    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:return_to)
      # redirect_to blogs_path, notice: "Logged in!"
    else
      flash[:alert] = "incorrect email or password! please try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    # redirect_to session.delete(:return_to)
    # redirect_to root_path, notice: "Logged Out!"
    redirect_to root_path
  end
end
