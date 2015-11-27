class FavoritesController < ApplicationController

  before_action :authenticate_user

  def index
    @post = Post.all
    @fav = @post.joins(:favorites).where("favorites.user_id=#{current_user.id}")
    # render text: @fav.inspect
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
    @post ||= Post.friendly.find params[:post_id]
  end


end
