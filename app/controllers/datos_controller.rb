class DatosController < ApplicationController
  # GET /datos
  # GET /datos.xml
  def index
    @datos = Dato.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datos }
    end
  end

  # GET /datos/1
  # GET /datos/1.xml
  def show
    @dato = Dato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dato }
    end
  end

  # GET /datos/new
  # GET /datos/new.xml
  def new
    @dato = Dato.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dato }
    end
  end

  # GET /datos/1/edit
  def edit
    @dato = Dato.find(params[:id])
  end

  # POST /datos
  # POST /datos.xml
  def create
    @dato = Dato.new(params[:dato])

    respond_to do |format|
      if @dato.save
        format.html { redirect_to(@dato, :notice => 'Dato was successfully created.') }
        format.xml  { render :xml => @dato, :status => :created, :location => @dato }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datos/1
  # PUT /datos/1.xml
  def update
    @dato = Dato.find(params[:id])

    respond_to do |format|
      if @dato.update_attributes(params[:dato])
        format.html { redirect_to(@dato, :notice => 'Dato was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datos/1
  # DELETE /datos/1.xml
  def destroy
    @dato = Dato.find(params[:id])
    @dato.destroy

    respond_to do |format|
      format.html { redirect_to(datos_url) }
      format.xml  { head :ok }
    end
  end
end
