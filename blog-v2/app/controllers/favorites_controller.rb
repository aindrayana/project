class FavoritesController < ApplicationController

  before_action :authenticate_user

  def index

  end

  def create
    # render text: params
    favorite = current_user.favorites.new
    # post = Post.find params[:post_id]
    favorite.post = post
    # favorite.user = current_user
    if favorite.save
      redirect_to blog_path(post), notice: "favorited!"
    else
      redirect_to blog_path(post), alert: "Can't favorite twice!"
    end
  end

  def destroy
    # post = Post.find params[:post_id]
    favorite = current_user.favorites.find params[:id]
    favorite.destroy
    redirect_to blog_path(post), notice: "favorites removed!"
  end

  def post
    @post ||= Post.find params[:post_id]
  end


end
