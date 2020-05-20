class CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(params.require(:comment).permit(:body))
    # and then associate it with a user
    @comment.user = @current_user
    @comment.save
    redirect_to review_path(@review)
  end


end
