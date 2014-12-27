class BulkMailer < ActionMailer::Base
  include Resque::Mailer
  
  def send_to_self(user, email)
    @user = user
    @body = email.body
    mail(:subject => email.subject, :to => @user.email)
  end

  def send_manual(recipient_id)    
    @recipient = EmailRecipient.find(recipient_id)
    @email = @recipient.email
    mail(:subject => @email.subject, :from => @email.from, :to => @recipient.to, :cc => @recipient.cc)
  end

end
