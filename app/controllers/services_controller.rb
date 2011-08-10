class ServicesController < ApplicationController
  respond_to :html, :js
  
  # GET /services
  # GET /services.xml
  def index
    @services = current_professional.proaccount.services

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @services }
    end
  end

  # GET /services/1
  # GET /services/1.xml
  def show
    @service = current_professional.proaccount.services.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service }
    end
  end

  # GET /services/new
  # GET /services/new.xml
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @service }
      
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.xml
  def create

    @service = current_professional.proaccount.services.new(params[:service])
    
    respond_to do |format|
      if @service.save
        @services = current_professional.proaccount.services
        format.html { redirect_to(proaccounts_edit_service_path, :notice => 'Service was successfully created.') }
        #format.xml  { render :xml => @service, :status => :created, :location => @service }
        format.js   #{ render :nothing => true }  
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
        format.js   #{ render :nothing => true }  
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = current_professional.proaccount.services.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to(@service, :notice => 'Service was successfully updated.') }
        #format.xml  { head :ok }
        format.js   { render :nothing => true }  
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
        format.js   { render :nothing => true }  
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(services_url) }
      format.xml  { head :ok }
    end
  end
end
