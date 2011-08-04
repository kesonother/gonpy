class ProaccountsController < ApplicationController
  # GET /proaccounts
  # GET /proaccounts.xml
  def index
    @proaccounts = Proaccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proaccounts }
    end
  end

  # GET /proaccounts/1
  # GET /proaccounts/1.xml
  def show
    @proaccount = Proaccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proaccount }
    end
  end

  # GET /proaccounts/new
  # GET /proaccounts/new.xml
  def new
    @proaccount = Proaccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proaccount }
    end
  end

  # GET /proaccounts/1/edit
  def edit
    @proaccount = Proaccount.find(params[:id])
  end

  # POST /proaccounts
  # POST /proaccounts.xml
  def create
    @proaccount = Proaccount.new(params[:proaccount])

    respond_to do |format|
      if @proaccount.save
        format.html { redirect_to(@proaccount, :notice => 'Proaccount was successfully created.') }
        format.xml  { render :xml => @proaccount, :status => :created, :location => @proaccount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proaccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proaccounts/1
  # PUT /proaccounts/1.xml
  def update
    @proaccount = Proaccount.find(params[:id])

    respond_to do |format|
      if @proaccount.update_attributes(params[:proaccount])
        format.html { redirect_to(@proaccount, :notice => 'Proaccount was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proaccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proaccounts/1
  # DELETE /proaccounts/1.xml
  def destroy
    @proaccount = Proaccount.find(params[:id])
    @proaccount.destroy

    respond_to do |format|
      format.html { redirect_to(proaccounts_url) }
      format.xml  { head :ok }
    end
  end
end
