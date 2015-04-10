class CommentsController < ApplicationController

  def new

  end

  def create
    @comment = Comment.new(question_params)
    if @comment.save
      redirect_to @comment.commentable
    else
      [500, "UHOH! ERROR!"]
    end
  end

  private

  def question_params
    params.require(:comments).permit(:body)
  end
end
