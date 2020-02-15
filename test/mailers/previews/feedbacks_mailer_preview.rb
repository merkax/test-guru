# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  def feedback_message
    feedback = Feedback.new(user: User.first, message: Feedback.first.message)
    
    FeedbacksMailer.feedback_message(feedback)
  end
end
