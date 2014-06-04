class CrpsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!
  # GET /crps
  # GET /crps.json
  def index
    @crps = Crp.all
  end

  # GET /crps/1
  # GET /crps/1.json
  def show
    @crp = Crp.find(params[:id])
  end

  # GET /crps/new
  # GET /crps/new.json
  def new
    @crp = Crp.new
  end

  # GET /crps/1/edit
  def edit
    @crp = Crp.find(params[:id])
  end

  # POST /crps
  # POST /crps.json
  def create
    @crp = Crp.new(params[:crp])

    if @crp.save
      redirect_to @crp, notice: 'Crp was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /crps/1
  # PUT /crps/1.json
  def update
    @crp = Crp.find(params[:id])

    if @crp.update_attributes(params[:crp])
      redirect_to @crp, notice: 'Crp was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /crps/1
  # DELETE /crps/1.json
  def destroy
    @crp = Crp.find(params[:id])
    @crp.destroy

    redirect_to crps_url
  end
end
