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
    @new_answer = Answer.new(body: answer_params, user: @user, question: @question)
    if @new_answer.save
      redirect_to @question
    else
      [500, "YOU MESSED UP!"]
    end
  end

  private

  def answer_params
    params.require(:answers).permit(:body)
  end

end
