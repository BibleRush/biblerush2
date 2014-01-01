class UserMailer < ActionMailer::Base
  BIBLERUSH_URL = 'http://biblerush.com'

  default from: 'noreply@biblerush.com'

  def invite_to_plan_email(invite)
    @invite = invite
    @url = BIBLERUSH_URL
    mail(to: @invite.email, subject: "You're invited to BibleRush.com!")
  end

  def new_comment_notification(params)
    @comment_text = params.fetch(:comment_text)
    @to_user      = params.fetch(:to_user)
    @commenter    = params.fetch(:commenter)
    @passage_ref  = params.fetch(:passage_ref)
    @plan_url     = "#{BIBLERUSH_URL}#{params.fetch(:plan_url)}"
    subject = "New comment by #{@commenter.username} on #{@passage_ref}"
    mail(to: @to_user.email, subject: subject)
  end
end
