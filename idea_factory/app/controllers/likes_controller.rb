class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    session[:return_to] ||= request.referer
    like = Like.new
    idea = Idea.find params[:idea_id]
    like.idea = idea
    like.user = current_user
    if like.save
      redirect_to session.delete(:return_to)
      # redirect_to idea_path(idea), notice: "Thanks for liking!"
    else
      redirect_to idea_path(idea), alert: "Can't like twice!"
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    idea = Idea.find params[:idea_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to session.delete(:return_to)
    # redirect_to idea_path(idea), notice: "Like removed!"
  end
end
