class CommentsController < ApplicationController
  def new
    @parent = params[:question]
  end

  def create
    @comment = Comment.new(question_params)
    @comment.save!
    redirect_to @comment.commentable.question
  end

  private

  def question_params
    params.require(:comments).permit(:body, :commentable_type, :commentable_id, :user_id)
  end
end
