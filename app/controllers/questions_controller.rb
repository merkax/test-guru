class QuestionsController < ApplicationController

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  private

  def rescue_with_test_not_found
    render plain: 'Вопрос не найден'
  end
end
