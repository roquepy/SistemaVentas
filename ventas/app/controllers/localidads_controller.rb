require 'custom_logger'
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
        format.html { redirect_to @localidad, notice: 'Los datos de la Localidad se han creado correctamente' }
        CustomLogger.info("Se ha creado una nueva Localidad:#{@localidad.nombre.inspect} perteneciente al departamento de: #{@localidad.departamento.nombre.inspect} .Usuario Responsable:#{current_user.funcionario.full_name.inspect}, Fecha y Hora: #{Time.now}")
        format.json { render json: @localidad, status: :created, location: @localidad }
        format.js{}
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
    localidad_antigua= @localidad.nombre
    departamento_antiguo= @localidad.departamento.nombre
    respond_to do |format|
      if @localidad.update_attributes(params[:localidad])
        localidad_nueva= @localidad.nombre
        departamento_nuevo= @localidad.departamento.nombre
        CustomLogger.info("Datos antes de realizar la Actualizacion: Localidad: #{localidad_antigua.inspect} y Departamento: #{departamento_antiguo.inspect} .Usuario Responsable: #{current_user.funcionario.full_name.inspect} ; Nuevos Datos: Localidad: #{localidad_nueva.inspect} y Departamento: #{departamento_nuevo.inspect} , Fecha y Hora: #{Time.now}")
        format.html { redirect_to @localidad, notice: 'Los datos de la Localidad se han actualizado correctamente' }
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
    begin
    @localidad.destroy
    notice= "El departamento ha sido eliminado"
    CustomLogger.info("La Localidad: #{@localidad.nombre.inspect} y el Departamento:#{@localidad.departamento.nombre.inspect} han sido eliminados. Usuario Responsable: #{current_user.funcionario.full_name.inspect} , Fecha y Hora: #{Time.now}")
    rescue
    notice= "La localidad y el departamento no pueden ser eliminados"
    CustomLogger.info(" Error al intentar eliminar la Localidad: #{@localidad.nombre.inspect} y el Departamento:#{@localidad.departamento.nombre.inspect} ha sido eliminados. Usuario Responsable: #{current_user.funcionario.full_name.inspect} , Fecha y Hora: #{Time.now}")
    ensure
      respond_to do |format|
      format.html { redirect_to localidads_url }
      format.json { head :no_content }
    end
  end
  end
  def departamento_new
      @departamento= Departamento.new
     
  end
end
