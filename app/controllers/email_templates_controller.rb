class EmailTemplatesController < ApplicationController
  before_filter :authenticate_user!
  # GET /email_templates
  # GET /email_templates.json
  def index
    @email_templates = current_user.admin? ? EmailTemplate.all : EmailTemplate.non_default
  end

  # GET /email_templates/1
  # GET /email_templates/1.json
  def show
    @email_template = EmailTemplate.find(params[:id])
  end

  # GET /email_templates/new
  # GET /email_templates/new.json
  def new
    @email_template = EmailTemplate.new
  end

  # GET /email_templates/1/edit
  def edit
    @email_template = EmailTemplate.find(params[:id])
  end

  # POST /email_templates
  # POST /email_templates.json
  def create
    @email_template = EmailTemplate.new(params[:email_template])

    if @email_template.save
      redirect_to @email_template, notice: 'Email template was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @email_template = EmailTemplate.find(params[:id])

    if @email_template.update_attributes(params[:email_template])
      redirect_to @email_template, notice: 'Email template was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /email_templates/1
  # DELETE /email_templates/1.json
  def destroy
    @email_template = EmailTemplate.find(params[:id])
    @email_template.destroy

    redirect_to email_templates_url
  end
end
