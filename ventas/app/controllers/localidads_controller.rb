class LocalidadsController < ApplicationController
    before_filter :require_login
  # GET /localidads
  # GET /localidads.json
  def index
    @localidads = Localidad.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localidads }
    end
  end

  # GET /localidads/1
  # GET /localidads/1.json
  def show
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localidad }
    end
  end

  # GET /localidads/new
  # GET /localidads/new.json
  def new
    @localidad = Localidad.new
    departamento_new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localidad }
    end
  end

  # GET /localidads/1/edit
  def edit
    @localidad = Localidad.find(params[:id])
     departamento_new
  end

  # POST /localidads
  # POST /localidads.json
  def create
    @localidad = Localidad.new(params[:localidad])
     departamento_new
    respond_to do |format|
      if @localidad.save
        format.html { redirect_to @localidad, notice: 'Se ha guardado correctamente la localidad' }
        format.json { render json: @localidad, status: :created, location: @localidad }
  
      else
        format.html { render action: "new" }
        format.json { render json: @localidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /localidads/1
  # PUT /localidads/1.json
  def update
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      if @localidad.update_attributes(params[:localidad])
        format.html { redirect_to @localidad, notice: 'Se ha actualizado correctamente la localidad' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localidads/1
  # DELETE /localidads/1.json
  def destroy
    @localidad = Localidad.find(params[:id])
    @localidad.destroy

    respond_to do |format|
      format.html { redirect_to localidads_url }
      format.json { head :no_content }
    end
  end
  def departamento_new
      @departamento= Departamento.new
     
  end
end
