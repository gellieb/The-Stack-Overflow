class QuestionController < ApplicationController
 before_action :set_question, only: [:show, :edit, :update, :destroy]
 def index
 end

 def new
 end

 def create
 end

 def show
 end

 def edit
 end

 def update
 end

 def destroy
 end

 private

   def set_question
     @question = Question.find(params[:id])
   end

   def question_params
    params.require(:question).permit(:)
  end
end