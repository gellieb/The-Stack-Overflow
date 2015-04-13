class AnswersController < ApplicationController
  def index
    @question = Question.find_by(id: params[:question_id])
    @answers = @question.answers
  end

  def show
    answer = Answer.find_by(id: params[:id])
  end

  def create
    @user = current_user
    @question = Question.find_by(id: params[:question_id])
    Answer.create!(body: answer_params[:body], user: @user, question: @question)
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answers).permit(:body)
  end
end
