class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update destroy show edit]
  def create 
  	question = Question.create( question_params )
   
    redirect_to question_path(question), notice: "New question create"
  end

  def update 
    @question.update( question_params )

    redirect_to question_path(@question), notice: "Save question!"
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "Delete question!"
  end

  def show;end

  def index 
    @question = Question.new
    @questions = Question.all
  end
  def new 
    @question = Question.new
  end

  def edit;end 

  private 
  def set_question 
    @question = Question.find(params[:id]) 
  end
  def question_params  
    params.require(:question).permit(:body, :user_id)
  end

end
