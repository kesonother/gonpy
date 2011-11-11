class ProaccountsController < ApplicationController
  
   respond_to :html, :js, :json
  def index
    @proaccount = current_user.proaccount
    @address = @proaccount.address
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proaccount }
    end
  end
  
   def show

    #@proaccount = current_professional.proaccount
    #@address = @proaccount.address
    @proaccount = Proaccount.find(params[:id])
    @address = @proaccount.address
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proaccount }
    end

  end
  
  def new
    @proaccount = Proaccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proaccount }
    end
  end

  def create

    @proaccount = current_user.build_proaccount(params[:proaccount])
    
    respond_to do |format|
      if @proaccount.save
        #@address = @proaccount.build_address()
        flash[:notice] = "La modification de votre profil a ete prise en compte!"
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @proaccount, :status => :created, :location => @proaccount }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proaccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
     @proaccount = current_user.proaccount
     
     if @proaccount.nil?
        @proaccount = Proaccount.new
        @address = Address.new
     elsif
       @address = @proaccount.address
     end

  end

  # PUT /proaccounts/1
  # PUT /proaccounts/1.xml
  def update
    @proaccount = current_user.proaccount

    respond_to do |format|
      if @proaccount.update_attributes(params[:proaccount])
        
        format.html { redirect_to(@proaccount, :notice => 'Service was successfully updated.') }
        #format.xml  { head :ok }
        format.js   #{ render :nothing => true }  
  
      end
    end
  end
  
  def edit_service
      
        @service = Service.new
        
        if current_user.proaccount.services.exists?
          @services = current_user.proaccount.services
        end
        
        respond_to do |format|
          format.html # edit_service.html.erb
          format.xml  { render :xml => @services }
        end

  end
  
  def photo
    @picture = Picture.new
    
    if current_user.proaccount.pictures.exists?
      @pictures = current_user.proaccount.pictures.first()    
    end
    
    respond_to do |format|
      format.html # photo.html.erb
      format.xml  { render :xml => @pictures }
    end
  end
  
  def edit_photo
     @picture = Picture.new
     
    if current_user.proaccount.pictures.exists?
      @pictures = current_user.proaccount.pictures.first()    
    end
    
    respond_to do |format|
      format.html # edit_photo.html.erb
      format.xml  { render :xml => @pictures }
    end
  end
  
  def crop

    if current_user.proaccount.pictures.exists?
      @pictures = current_user.proaccount.pictures.first()
      
    end
    
    respond_to do |format|
      format.html # crop.html.erb
      format.xml  { render :xml => @pictures }
    end
  end
  
  def settings
  end

end
