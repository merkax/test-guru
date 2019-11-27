class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create show]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render inline: 'Вопросы теста: <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Вопрос: <%= @question.inspect %>'
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end 
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_test_not_found
    render plain: 'Вопрос не найден'
  end
end
