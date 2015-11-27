class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    comment_params = params.require(:comment).permit(:body)
    @post = @blog = Post.friendly.find params[:post_id]
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    # # render text: "inspect:<br> #{@comment.post.inspect}"
    respond_to do |format|
    # # render text: "inspect:<br> #{blog_path(@post)}"
      if @comment.save
    #     # redirect_to(blog_path(@post))
        format.html { redirect_to blog_path(@post), notice: "Comment created successfully" }
        format.js { render :create_success }
      else
        format.html { render "/blogs/show" }
        format.js { render :create_failure }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    redirect_to root_path, alert: "access denied!" unless can?(:destroy, @comment)
    @comment.destroy
    # redirect_to blog_path(comment.post), notice: "Comment deleted"
    respond_to do |format|
      format.html { redirect_to blog_path(@comment.post), notice: "Answer deleted" }
      format.js   { render }
    end

  end

end
