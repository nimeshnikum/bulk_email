class BulkMailer < ActionMailer::Base
  def send_to_self(user, email)
    @user = user
    @body = email.body
    mail(:subject => email.subject, :to => @user.email)
  end

  def send_manual(user, recipient)
    @recipient = recipient
    @email = recipient.email
#    raise @email.body.inspect
    attachments.inline['test.jpg'] = "http://localhost:3000/uploads/bootsy/image/1/small_newyear_2012.jpg"
    mail(:subject => @email.subject, :from => @email.from, :to => recipient.to, :cc => recipient.cc)
  end
end
