#Requerido para obtener la Auditoria del ABM Producto:
require 'custom_logger'

class FuncionariosController < ApplicationController
    before_filter :require_login
  # GET /funcionarios
  # GET /funcionarios.json
  def index
     @funcionarios = Funcionario.paginate(:page => params[:page], :per_page => 10)
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcionarios }
    end
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/new
  # GET /funcionarios/new.json
  def new
    @funcionario = Funcionario.new
    localidad_new
    @estados_funcionarios=EstadosFuncionario.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario = Funcionario.find(params[:id])
     localidad_new
  end


 # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(params[:funcionario])
     localidad_new
    respond_to do |format|
      if @funcionario.save
        format.html {  redirect_to @funcionario, notice: 'Los datos del funcionario se han creado correctamente' }
        CustomLogger.info("Se ha creado un Nuevo Funcionario con los siguientes datos: Nombre:#{@funcionario.nombres.inspect}, Apellido:#{@funcionario.apellidos.inspect}, Nro de RUC o CI:#{@funcionario._num_identidad.inspect}, Direccion:#{@funcionario.direccion.inspect}, Telefono:#{@funcionario.telefono.inspect}, Estado Civil:#{@funcionario.estado_civil.inspect}, Sexo:#{@funcionario.sexo.inspect}, Localidad:#{@funcionario.localidad.nombre.inspect}, Estado del Funcionario:#{@funcionario.estados_funcionario.descripcion.inspect}, Funcion:#{@funcionario.funcion.nombre.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @funcionario, status: :created, location: @funcionario }
        format.js   {}
      else
        format.html { render action: "new" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /funcionarios/1
  # PUT /funcionarios/1.json
  def update
    @funcionario = Funcionario.find(params[:id])
    nombre_antiguo= @funcionario.nombres
    apellido_antiguo= @funcionario.apellidos
    num_identidad_antiguo= @funcionario.num_identidad
    direccion_antigua= @funcionario.direccion
    telefono_antiguo= @funcionario.telefono
    estado_civil_antiguo= @funcionario.estado_civil
    sexo_antiguo= @funcionario.sexo
    localidad_antigua= @funcionario.localidad.nombre
    estado_funcionario_antiguo= @funcionario.estados_funcionario.descripcion
    funcion_antiguo= @funcionario.funcion.nombre 
    respond_to do |format|
      if @funcionario.update_attributes(params[:funcionario])
            nombre_nuevo= @funcionario.nombres
            apellido_nuevo= @funcionario.apellidos
            num_identidad_nuevo= @funcionario.num_identidad
            direccion_nueva= @funcionario.direccion
            telefono_nuevo= @funcionario.telefono
            estado_civil_nuevo= @funcionario.estado_civil
            sexo_nuevo= @funcionario.sexo
            localidad_nueva= @funcionario.localidad.nombre
            estado_funcionario_nuevo= @funcionario.estados_funcionario.descripcion
            funcion_nuevo= @funcionario.funcion.nombre 

            CustomLogger.info("Datos antes de realizar la Actualizacion de Funcionarios: Nombre: #{nombre_antiguo.inspect}, Apellido:#{apellido_antiguo.inspect}, Num de CI o RUC:#{num_identidad_antiguo.inspect}, Direccion:#{direccion_antigua.inspect}, Telefono:#{telefono_antiguo.inspect}, Estado Civil:#{estado_civil_antiguo.inspect}, Sexo:#{sexo_antiguo.inspect}, Localidad:#{localidad_antigua.inspect}, Estado del Funcionario:#{estado_funcionario_antiguo.inspect}, Funcion:#{funcion_antiguo.inspect} .Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Datos Actualizados: Nombre:#{nombre_nuevo.inspect}, Apellido:#{apellido_nuevo.inspect}, Num de CI o RUC:#{num_identidad_nuevo.inspect}, Direccion:#{direccion_nueva.inspect}, Telefono:#{telefono_nuevo.inspect}, Estado Civil:#{estado_civil_nuevo.inspect}, Sexo:#{sexo_nuevo.inspect}, Localidad:#{localidad_nueva.inspect}, Estado del Funcionario:#{estado_funcionario_nuevo.inspect}, Funcion:#{funcion_nuevo.inspect} . Fecha y Hora: #{Time.now}")
            format.html { redirect_to @funcionario, notice: 'Funcionario was successfully updated.' }
            format.json { head :no_content }
       else
        format.html { render action: "edit" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario = Funcionario.find(params[:id])
    begin
    @funcionario.destroy
    notice= "Los datos de Funcionario han sido eliminados"
    CustomLogger.info("Han sido eliminados los siguientes datos del Funcionario:Nombre:#{@funcionario.nombres.inspect}, Apellido:#{@funcionario.apellidos.inspect}, Nro de RUC o CI:#{@funcionario._num_identidad.inspect}, Direccion:#{@funcionario.direccion.inspect}, Telefono:#{@funcionario.telefono.inspect}, Estado Civil:#{@funcionario.estado_civil.inspect}, Sexo:#{@funcionario.sexo.inspect}, Localidad:#{@funcionario.localidad.nombre.inspect}, Estado del Funcionario:#{@funcionario.estados_funcionario.descripcion.inspect}, Funcion:#{@funcionario.funcion.nombre.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    rescue
    notice= "No pueden eliminarse lo datos de Funcionario"
    CustomLogger.info("Error al intentar eliminar los siguientes datos del Funcionario:Nombre:#{@funcionario.nombres.inspect}, Apellido:#{@funcionario.apellidos.inspect}, Nro de RUC o CI:#{@funcionario._num_identidad.inspect}, Direccion:#{@funcionario.direccion.inspect}, Telefono:#{@funcionario.telefono.inspect}, Estado Civil:#{@funcionario.estado_civil.inspect}, Sexo:#{@funcionario.sexo.inspect}, Localidad:#{@funcionario.localidad.nombre.inspect}, Estado del Funcionario:#{@funcionario.estados_funcionario.descripcion.inspect}, Funcion:#{@funcionario.funcion.nombre.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    ensure
      respond_to do |format|
      format.html { redirect_to funcionarios_url }
      format.json { head :no_content }
    end
  end
  end
  def localidad_new
      @localidad= Localidad.new
  end
end
