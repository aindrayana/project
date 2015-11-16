class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    comment_params = params.require(:comment).permit(:body)
    @q = Idea.find params[:idea_id]
    @comment = current_user.comments.new(comment_params)
    @comment.idea = @q
    if @comment.save
      redirect_to idea_path(@q), notice: "Comment created successfully"
    else
      flash[:alert] = @comment.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    comment = Comment.find params[:id]
    redirect_to root_path, alert: "access denied!" unless can?(:destroy, comment)
    comment.destroy
    redirect_to idea_path(comment.idea), notice: "Comment deleted"
  end


end
