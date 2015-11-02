class CommentsController < ApplicationController
  def create
    comment_params = params.permit([:body, :postid])
    # comment_params = params.require(:comment).permit([:body, :postid])
    @comment = Comment.new(comment_params)
    # render text: "inside add comment #{params} <br>id: #{params[:postid]}"
    # render text: "#{comment_params} redirect: #{view_blog_path(params[:postid])}"
    if @comment.save
        redirect_to(view_blog_path(params[:postid]))
    else
        render :new
    end
  end
end
