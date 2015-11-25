class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find params[:post_id]
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    # render text: "inspect:<br> #{@comment.post.inspect}"
    if @comment.save
      redirect_to(blog_path(@post))
    else
        render :new
    end
  end

  def destroy
    comment = Comment.find params[:id]
    redirect_to root_path, alert: "access denied!" unless can?(:destroy, comment)
    comment.destroy
    redirect_to blog_path(comment.post), notice: "Comment deleted"
  end


end
