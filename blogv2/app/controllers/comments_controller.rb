class CommentsController < ApplicationController
  # before_action :authenticate_user
  def create
    comment_params = params.permit([:body, :post_id])
    # comment_params = params.require(:comment).permit([:body, :postid])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    # render text: "inside add comment #{params} <br>id: #{params[:postid]}"
    # render text: "#{comment_params} redirect: #{view_blog_path(params[:postid])}"
    if @comment.save
        redirect_to(blog_path(params[:post_id]))
    else
        render :new
    end
  end
end
