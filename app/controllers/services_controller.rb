class ServicesController < ApplicationController
   before_filter :authenticate_user!
  respond_to :html, :js
  
  # GET /services
  # GET /services.xml
  def index
    @services = current_user.proaccount.services

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @services }
    end
  end

  # GET /services/1
  # GET /services/1.xml
  def show
    @service = current_user.proaccount.services.find(params[:id])

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
    @service = current_user.proaccount.services.find(params[:id])
    if current_user.proaccount.services.exists?
      @services = current_user.proaccount.services
    end
  end

  # POST /services
  # POST /services.xml
  def create

    @service = current_user.proaccount.services.new(params[:service])
    
    respond_to do |format|
      if @service.save
        @services = current_user.proaccount.services
        format.html { redirect_to(proaccounts_edit_service_path, :notice => 'Service was successfully created.') }
        #format.xml  { render :xml => @service, :status => :created, :location => @service }
        format.js   #{ render :nothing => true }  
      else
        format.html { render :template => 'proaccounts/edit_service' } 
        #format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
        #format.js   { render :template => 'proaccounts/edit_service' }  
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = current_user.proaccount.services.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        #format.html { redirect_to(@service, :notice => 'Service was successfully updated.') }
        format.html { redirect_to(proaccounts_edit_service_path, :notice => 'Service mis &agrave; jour avec succ&egrave;s.')}
        #format.xml  { head :ok }
        format.js   { render :nothing => true }  
      else
        format.html { redirect_to(proaccounts_edit_service_path)}
        #format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
        format.js   { render :nothing => true }  
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = current_user.proaccount.services.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(proaccounts_edit_service_path, :notice => 'Service mis &agrave; jour avec succ&egrave;s.')}
      format.xml  { head :ok }
    end
  end
end
