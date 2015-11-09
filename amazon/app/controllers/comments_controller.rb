class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    # render text: params
    # => require(:answer) and params[:question_id] is coming from the url params (check by render text: params)

    comment_params = params.require(:comment).permit(:body)
    @q = Product.find params[:product_id]
    @comment = Comment.new(comment_params)
    # this associates the @answer with question 'q'
    @comment.product = @q      # look at the notes on day12.txt
    if @comment.save
      redirect_to product_path(@q), notice: "Answer created successfully"
    else
      flash[:alert] = @comment.errors.full_messages.join(", ")
      render "products/show"     #this will render within the same request cycle
    end
  end
end
