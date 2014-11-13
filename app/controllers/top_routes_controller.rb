class TopRoutesController < ApplicationController
  # GET /top_routes
  # GET /top_routes.json
  def index
    @top_routes = TopRoute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @top_routes }
    end
  end

  # GET /top_routes/1
  # GET /top_routes/1.json
  def show
    @top_route = TopRoute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @top_route }
    end
  end

  # GET /top_routes/new
  # GET /top_routes/new.json
  def new
    @top_route = TopRoute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @top_route }
    end
  end

  # GET /top_routes/1/edit
  def edit
    @top_route = TopRoute.find(params[:id])
  end

  # POST /top_routes
  # POST /top_routes.json
  def create
    @top_route = TopRoute.new(params[:top_route])

    respond_to do |format|
      if @top_route.save
        format.html { redirect_to @top_route, notice: 'Top route was successfully created.' }
        format.json { render json: @top_route, status: :created, location: @top_route }
      else
        format.html { render action: "new" }
        format.json { render json: @top_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /top_routes/1
  # PUT /top_routes/1.json
  def update
    @top_route = TopRoute.find(params[:id])

    respond_to do |format|
      if @top_route.update_attributes(params[:top_route])
        format.html { redirect_to @top_route, notice: 'Top route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @top_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_routes/1
  # DELETE /top_routes/1.json
  def destroy
    @top_route = TopRoute.find(params[:id])
    @top_route.destroy

    respond_to do |format|
      format.html { redirect_to top_routes_url }
      format.json { head :no_content }
    end
  end

  def search
    @top_routes = TopRoute.where("country_name like ?", "#{params[:q]}%").select([:country_name, :id])
    render :json => @top_routes.to_json
  end

  def import
    unless params[:file].blank?
      full_upload = params[:full_upload_button] ? true : false
      TopRoute.import(params[:file], full_upload)
      redirect_to top_routes_url, notice: "Top routes imported"
    else
      redirect_to top_routes_url
    end
  end
end
