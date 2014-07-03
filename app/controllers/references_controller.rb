class ReferencesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!
  before_filter :find_account
  # GET /references
  # GET /references.json
  def index
    @references = @account.references.all
  end

  # GET /references/1
  # GET /references/1.json
  def show
    @reference = @account.references.find(params[:id])
  end

  # GET /references/new
  # GET /references/new.json
  def new
    @reference = @account.references.new
  end

  # GET /references/1/edit
  def edit
    @reference = @account.references.find(params[:id])
  end

  # POST /references
  # POST /references.json
  def create
    @reference = @account.references.new(params[:reference])

    if @reference.save
      redirect_to [@account, @reference], notice: 'Reference was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /references/1
  # PUT /references/1.json
  def update
    @reference = @account.references.find(params[:id])

    if @reference.update_attributes(params[:reference])
      redirect_to [@account, @reference], notice: 'Reference was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference = @account.references.find(params[:id])
    @reference.destroy

    redirect_to account_references_url(@account)
  end

  def move_to_prospect
    @reference = @account.references.find(params[:id])

    if @reference.generate_prospect
      redirect_to account_references_url, notice: 'Reference was successfully updated.'
    else
      flash[:error] = "Reference has already been moved to prospect!"
      redirect_to account_references_url
    end

  end

  private

  def find_account
    @account = Account.find(params[:account_id])
  end
end
