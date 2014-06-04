class AccountContactsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!
  before_filter :find_account

  # GET /account_contacts
  # GET /account_contacts.json
  def index
    @account_contacts = @account.account_contacts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_contacts }
    end
  end

  # GET /account_contacts/1
  # GET /account_contacts/1.json
  def show
    @account_contact = @account.account_contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_contact }
    end
  end

  # GET /account_contacts/new
  # GET /account_contacts/new.json
  def new
    @account_contact = @account.account_contacts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_contact }
    end
  end

  # GET /account_contacts/1/edit
  def edit
    @account_contact = @account.account_contacts.find(params[:id])
  end

  # POST /account_contacts
  # POST /account_contacts.json
  def create
    @account_contact = @account.account_contacts.new(params[:account_contact])

    if @account_contact.save
      redirect_to [@account, @account_contact], notice: 'Account contact was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /account_contacts/1
  # PUT /account_contacts/1.json
  def update
    @account_contact = @account.account_contacts.find(params[:id])

    if @account_contact.update_attributes(params[:account_contact])
      redirect_to [@account, @account_contact], notice: 'Account contact was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /account_contacts/1
  # DELETE /account_contacts/1.json
  def destroy
    @account_contact = @account.account_contacts.find(params[:id])
    @account_contact.destroy

    respond_to do |format|
      format.html { redirect_to account_account_contacts_url(@account) }
      format.json { head :no_content }
    end
  end

  private

  def find_account
    @account = Account.find(params[:account_id])
  end
end
