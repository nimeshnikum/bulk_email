class AccountRepsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!
  before_filter :find_user

  # GET /account_reps
  # GET /account_reps.json
  def index
    @account_reps = @user.account_reps.all
    @new_account_rep = @user.account_reps.new
  end

  # GET /account_reps/1
  # GET /account_reps/1.json
  def show
    @account_rep = @user.account_reps.find(params[:id])
  end

  # GET /account_reps/new
  # GET /account_reps/new.json
  def new
    @account_rep = @user.account_reps.new
  end

  # GET /account_reps/1/edit
  def edit
    @account_rep = @user.account_reps.find(params[:id])
  end

  # POST /account_reps
  # POST /account_reps.json
  def create
    @account_rep = @user.account_reps.new(params[:account_rep])

    if @account_rep.save
#      redirect_to [@user, @account_rep], notice: 'Account rep was successfully created.'
      render :js => "window.location.href='" + user_account_reps_url + "'"
    else
      render action: "new"
    end
  end

  # PUT /account_reps/1
  # PUT /account_reps/1.json
  def update
    @account_rep = @user.account_reps.find(params[:id])

    if @account_rep.update_attributes(params[:account_rep])
      render :json => render_to_string(:partial => 'account_rep', :locals => {:account_rep => @account_rep}).to_json
    else
      render action: "edit"
    end
  end

  # DELETE /account_reps/1
  # DELETE /account_reps/1.json
  def destroy
    @account_rep = @user.account_reps.find(params[:id])
    @account_rep.destroy

    redirect_to user_account_reps_url(@user)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
