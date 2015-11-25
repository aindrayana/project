class SessionsController < ApplicationController
  def new
  end

  def create
    session[:return_to] ||= request.referer
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # if (user.admin)
      #   session.delete(:return_to)
      #   redirect_to posts_path
      # else
        redirect_to session.delete(:return_to)
      # end
      # redirect_to root_path
    else
      flash[:alert] = "incorrect email or password! please try again"
      render :new
    end
  end

  def destroy
    # session[:return_to] ||= request.referer
    session[:user_id] = nil
    # redirect_to session.delete(:return_to)
    redirect_to root_path
  end

end
