class AccountsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :action => :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    if @account.update_attributes(params[:account])
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :action => :edit
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def destroy
    @account = Account.find(params[:id])

    @account.destroy

    redirect_to accounts_url, notice: 'Account was successfully deleted.'
  end
end
