class QuestionsController < ApplicationController
 before_action :set_question, only: [:show, :edit, :update, :destroy]
 def index
   @questions = Question.all
 end

 def new
  @question = Question.new
 end

 def create
 end

 def show
 end

 def edit
 end

 def update
   p params[:question]
   if @question.update question_params
     redirect_to question_path(@question)
   else
    render :edit
  end
 end

 def destroy
   @question.destroy
   redirect_to questions_path(Question.all)
 end

 private

   def set_question
     @question = Question.find params[:id]
   end

   def question_params
     p params[:question]
    params.require(:question).permit(:title, :body, :user_id)
  end
end
