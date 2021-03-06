class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: %i[index create new] #show
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test]
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
