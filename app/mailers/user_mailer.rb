class UserMailer < ActionMailer::Base
  BIBLERUSH_URL = 'http://biblerush.com'

  default from: 'noreply@biblerush.com'

  def invite_to_plan_email(invite)
    @invite = invite
    @url = BIBLERUSH_URL
    mail(to: @invite.email, subject: "You're invited to BibleRush.com!")
  end
end
