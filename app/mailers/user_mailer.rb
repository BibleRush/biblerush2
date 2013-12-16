class UserMailer < ActionMailer::Base
  default from: 'noreply@biblerush.com'

  def invite_to_plan_email(invite)
    @invite = invite
    @url = 'http://biblerush.com'
    mail(to: @invite.email, subject: "You're invited to BibleRush.com!")
  end
end
