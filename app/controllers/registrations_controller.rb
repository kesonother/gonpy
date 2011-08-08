class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end
  
  def create
     super # creates the @user
     @proaccount = Proaccount.new
      @user=resource
       #@user.build_proaccount(business_name: "test")
      respond_to do |format|
#      if @proaccount.save
        format.html { redirect_to(@proaccount, :notice => 'test.') }
        format.xml  { render :xml => @proaccount, :status => :created, :location => @proaccount }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @proaccount.errors, :status => :unprocessable_entity }
#      end
    end
  end
  
end
