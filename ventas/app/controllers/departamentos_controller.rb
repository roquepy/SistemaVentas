require 'custom_logger'
class DepartamentosController < ApplicationController
  #
  # Antes de hacer cualquier cosa con este controler,
  # se verifica si hay permiso para el usuario logueado
  #
    before_filter :require_login

  # GET /departamentos
  # GET /departamentos.json
  def index
   @departamentos = Departamento.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departamentos }
    end
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
    @departamento = Departamento.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/new
  # GET /departamentos/new.json
  def new
    @departamento = Departamento.new
    @localidades=Localidad.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/1/edit
  def edit
     @departamento = Departamento.find(params[:id])
     @localidades=Localidad.all
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(params[:departamento])
    @localidades=Localidad.all
    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: 'Los datos del Departamento se han creado correctamente' }
        CustomLogger.info("Se ha creado un nuevo Departamento:#{@departamento.nombre.inspect} .Usuario Responsable:#{current_user.funcionario.full_name.inspect}, Fecha y Hora: #{Time.now}")
        format.json { render json: @departamento, status: :created, location: @departamento }
          format.js   {}
      else
        format.html { render action: "new"}
        CustomLogger.error("Error al intentar Crear un Nuevo Departamento. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departamentos/1
  # PUT /departamentos/1.json
  def update
    @departamento = Departamento.find(params[:id])
    departamento_antiguo= @departamento.nombre
    respond_to do |format|
      if @departamento.update_attributes(params[:departamento])
        departamento_nuevo= @departamento.nombre
        CustomLogger.info("Dato antes de realizar la Actualizacion: Departamento: #{departamento_antiguo.inspect} .Usuario Responsable: #{current_user.funcionario.full_name.inspect} ; Nuevos Datos: Departamento: #{departamento_nuevo.inspect} , Fecha y Hora: #{Time.now}")
        format.html { redirect_to @departamento, notice: 'Los datos del Departamento se han actualizado correctamente' }
        format.json { head :no_content }
      else
        @departamentos = Departamento.find(:all)
        CustomLogger.error("Error al intentar realizar la actualizacion del siguiente Departamento: #{departamento_antiguo.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.html { render action: "edit" }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento = Departamento.find(params[:id])
    @destruyo = false
    begin
      if @departamento.destroy
        @destruyo = true
      end
     notice= "El departamento ha sido eliminado"
     CustomLogger.info("El Departamento:#{@departamento.nombre.inspect} ha sido eliminado. Usuario Responsable: #{current_user.funcionario.full_name.inspect} , Fecha y Hora: #{Time.now}")
      rescue
      notice= "El departamento no puede ser eliminado"
      CustomLogger.error("Error al intentar eliminar el Departamento:#{@departamento.nombre.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect} , Fecha y Hora: #{Time.now}")
      ensure
      respond_to do |format|
      format.js
    end
  end
end
end