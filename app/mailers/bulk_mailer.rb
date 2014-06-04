class BulkMailer < ActionMailer::Base
  default from: "trylynxmarketing@gmail.com"

  def send_to_self(user, email)
    @user = user
    @body = email.body
    mail(:subject => email.subject, :to => @user.email)
  end

  def send_manual(user, email, account, top_routes)
    @email = email
    @top_routes = top_routes
    mail(:subject => @email.subject, :from => user.email, :to => account.main_contacts, :cc => account.cc_contacts)
  end
end
