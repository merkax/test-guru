class FeedbacksMailer < ApplicationMailer

  def feedback_message(feedback)
    @admin = Admin.first.email
    @user = feedback.user.email
    @message = feedback.message

    mail from: @user, to: @admin #ENV['FEEDBACK_EMAIL']
  end
end
