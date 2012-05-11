class Invite < ActionMailer::Base
  default from: "contact@unicolor.com"
  def welcome_email(user,email,color)
   body="#{user.name} Invited you into Unicolor.com<br/>You can use #{color} to Register."
    mail(:to => email,
         :subject => "#{user.name} Invited you into Unicolor.com",:body=>body)
  end
end
