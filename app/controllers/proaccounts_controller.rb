class ProaccountsController < ApplicationController
  
   def show

    @proaccount = current_professional.proaccount
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

    @proaccount = current_professional.build_proaccount(params[:proaccount])
    
    respond_to do |format|
      if @proaccount.save
        #@address = @proaccount.build_address()
        format.html { redirect_to(@proaccount, :notice => 'Proaccount was successfully created.') }
        format.xml  { render :xml => @proaccount, :status => :created, :location => @proaccount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proaccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
     @proaccount = current_professional.proaccount
     @address = @proaccount.address
     if @proaccount.nil?
        @proaccount = Proaccount.new
        @address = Address.new
     end

  end

  def edit_services
    
    @prestations = current_professional.proaccount.services
    @prestation = Prestation.new
    
    if @services.nil?
        
     end
  end

  def edit_photo
  end

  def settings
  end

end
