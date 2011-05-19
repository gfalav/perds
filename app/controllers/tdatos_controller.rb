class TdatosController < ApplicationController
  # GET /tdatos
  # GET /tdatos.xml
  def index
    @tdatos = Tdato.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tdatos }
    end
  end

  # GET /tdatos/1
  # GET /tdatos/1.xml
  def show
    @tdato = Tdato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tdato }
    end
  end

  # GET /tdatos/new
  # GET /tdatos/new.xml
  def new
    @tdato = Tdato.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tdato }
    end
  end

  # GET /tdatos/1/edit
  def edit
    @tdato = Tdato.find(params[:id])
  end

  # POST /tdatos
  # POST /tdatos.xml
  def create
    @tdato = Tdato.new(params[:tdato])

    respond_to do |format|
      if @tdato.save
        format.html { redirect_to(@tdato, :notice => 'Tdato was successfully created.') }
        format.xml  { render :xml => @tdato, :status => :created, :location => @tdato }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tdato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tdatos/1
  # PUT /tdatos/1.xml
  def update
    @tdato = Tdato.find(params[:id])

    respond_to do |format|
      if @tdato.update_attributes(params[:tdato])
        format.html { redirect_to(@tdato, :notice => 'Tdato was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tdato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tdatos/1
  # DELETE /tdatos/1.xml
  def destroy
    @tdato = Tdato.find(params[:id])
    @tdato.destroy

    respond_to do |format|
      format.html { redirect_to(tdatos_url) }
      format.xml  { head :ok }
    end
  end
end
