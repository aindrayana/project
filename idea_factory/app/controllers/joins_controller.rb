class JoinsController < ApplicationController
  before_action :authenticate_user

  def create
    session[:return_to] ||= request.referer
    join = Join.new
    idea = Idea.find params[:idea_id]
    join.idea = idea
    join.user = current_user
    if join.save
      redirect_to session.delete(:return_to)
      # redirect_to idea_path(idea), notice: "Thanks for liking!"
    else
      redirect_to idea_path(idea), alert: "Can't like twice!"
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    idea = Idea.find params[:idea_id]
    join = current_user.joins.find params[:id]
    join.destroy
    redirect_to session.delete(:return_to)
    # redirect_to idea_path(idea), notice: "Like removed!"
  end
end
