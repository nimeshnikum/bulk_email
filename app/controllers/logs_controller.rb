class LogsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!
  
  def index
    @emails = Email.ordered
  end

  def show
    @email = Email.find(params[:id])
    if @email.sent_at.blank?
      redirect_to write_email_url(@email)
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    redirect_to logs_url
  end
end
