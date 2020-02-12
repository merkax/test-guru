class TestPassage < ApplicationRecord

  PASSING_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  
  def completed?
    current_question.nil?
  end
  
  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end
  
  def total_test_question
    test.questions.count
  end
  
  def percent_correct
    (self.correct_questions.to_f / total_test_question) * 100
  end
  
  def success?
    percent_correct >= PASSING_SCORE
  end

  def current_question_position
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def percent_progress
    ((current_question_position - 1).to_f / total_test_question) * 100
  end
  
  
  private
  
  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
  
  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    # correct_answers_count = correct_answers.count

    # (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    # correct_answers_count == answer_ids.count

    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
