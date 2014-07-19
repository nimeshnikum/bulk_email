class EmailsController < ApplicationController
  before_filter :authenticate_user!

  def send_to_self
    @email = Email.new

    if request.post?
      @email = Email.new(params[:email])

      if @email.valid?
        BulkMailer.send_to_self(current_user, @email).deliver
        flash[:notice] = "Message sent successfully!"
        redirect_to send_to_self_emails_url
      else
        render :action => 'send_to_self'
      end
    end
  end

  def new
    @email_template = EmailTemplate.find(params[:email_template_id])
    @email = Email.new
    @email.initiate_from_template(@email_template)
  end

  def create
    @email = Email.new(params[:email])
    @email.sender = current_user

    if @email.save
      redirect_to write_email_url(@email)
    else
      render 'new'
    end
  end

  def write
    @email = Email.find(params[:id])
    @accounts = current_user.accounts
  end

  def send_email
    @email = Email.find(params[:id])
    @email.attributes = params[:email]

    if @email.valid?
      top_route_ids = params[:email][:top_route_ids].reject {|a| a.blank?}.flatten
      account_ids = params[:email][:account_ids].reject {|a| a.blank?}.flatten
      raise account_ids.inspect
    else
      @accounts = current_user.accounts
      render 'write'
    end
  end

  def send_manual
    @accounts = current_user.accounts
    @email = Email.new

    if request.post?
      @email = Email.new(params[:email])

      if @email.valid?
        @top_routes = TopRoute.find(params[:email][:top_route_ids].split(','))
        @email.account_ids.each do |account_id|
          account = Account.find(account_id)
          BulkMailer.send_manual(current_user, @email, account, @top_routes).deliver
        end
        flash[:notice] = "Email sent successfully!"
        redirect_to send_manual_emails_url
      else
        render :action => 'send_manual'
      end
      
    end
  end

  def select_template
    @email_template = EmailTemplate.find(params[:id])

    render :json => @email_template
  end
end
