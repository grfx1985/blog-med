class UserMailer < Devise::RegistrationsController
  def welcome(user)
    mail(:to => user.email, :subject => "welcome_email", :from => "automail@activeweb.pl")
  end
end