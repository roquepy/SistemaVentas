#Requerido para obtener la Auditoria del ABM Producto:
require 'custom_logger'

class ConfiguracionsController < ApplicationController
    before_filter :require_login

  # GET /configuracions
  # GET /configuracions.json
  def index
    @configuracions = Configuracion.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @configuracions }
    end
  end

  # GET /configuracions/1
  # GET /configuracions/1.json
  def show
    @configuracion = Configuracion.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @configuracion }
    end
  end

  # GET /configuracions/new
  # GET /configuracions/new.json
  def new
    @configuracion = Configuracion.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @configuracion }
    end
  end

  # GET /configuracions/1/edit
  def edit
    @configuracion = Configuracion.find(params[:id] )
  end

  # POST /configuracions
  # POST /configuracions.json
  def create
    @configuracion = Configuracion.new(params[:configuracion]) 
    respond_to do |format|
      if @configuracion.save
        format.html { redirect_to @configuracion, notice: 'Los datos de la Configuracion se han creado correctamente'}
        CustomLogger.info("Se ha creado una Nueva Configuracion para la Empresa. Datos: Logo: #{@configuracion.logo.inspect} , Nombre del Logo:#{@configuracion.nombre_logo.inspect}, Nombre de la Empresa: #{@configuracion.nombre_empresa.inspect}, Direccion:#{@configuracion.direccion.inspect}, RUC:#{@configuracion.ruc.inspect}, Timbrado:#{@configuracion.timbrado.inspect}, Fecha de Vencimiento de Timbrado:#{@configuracion.timbrado_vencimiento.inspect}, Telefono: #{@configuracion.telefono.inspect}, Telefono Auxiliar:#{@configuracion.telefono_auxiliar.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}, Fecha y Hora: #{Time.now}")
        format.json { render json: @configuracion, status: :created, location: @configuracion }
        format.js   {}
      else
        format.html { render action: "new" }
         CustomLogger.info("Error al intentar Crear una Nueva Configuracion para la Empresa. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
end

  # PUT /configuracions/1
  # PUT /configuracions/1.json
  def update
    @configuracion = Configuracion.find(params[:id])
    logo_antiguo= @configuracion.logo
    nombre_logo_antiguo= @configuracion.nombre_logo
    nombre_empresa_antiguo= @configuracion.nombre_empresa
    direccion_antigua= @configuracion.direccion
    ruc_antiguo= @configuracion.ruc
    timbrado_antiguo= @configuracion.timbrado
    timbrado_vencimiento_antiguo= @configuracion.timbrado_vencimiento
    telefono_antiguo= @configuracion.telefono
    telefono_auxiliar_antiguo= @configuracion.telefono_auxiliar
    respond_to do |format|
      if @configuracion.update_attributes(params[:configuracion])
         logo_nuevo= @configuracion.logo
         nombre_logo_nuevo= @configuracion.nombre_logo
         nombre_empresa_nuevo= @configuracion.nombre_empresa
         direccion_nueva= @configuracion.direccion
         ruc_nuevo= @configuracion.ruc
         timbrado_nuevo= @configuracion.timbrado
         timbrado_vencimiento_nuevo= @configuracion.timbrado_vencimiento
         telefono_nuevo= @configuracion.telefono
         telefono_auxiliar_nuevo= @configuracion.telefono_auxiliar

         CustomLogger.info("Datos antes de realizar la Actualizacion de la Configuracion de la Empresa: Logo: #{logo_antiguo.inspect} , Nombre del Logo:#{nombre_logo_antiguo.inspect}, Nombre de la Empresa: #{nombre_empresa_antiguo.inspect}, Direccion:#{direccion_antigua.inspect}, RUC:#{ruc_antiguo.inspect}, Timbrado:#{timbrado_antiguo.inspect}, Fecha de Vencimiento de Timbrado:#{timbrado_vencimiento_antiguo.inspect}, Telefono: #{telefono_antiguo.inspect}, Telefono Auxiliar:#{telefono_auxiliar_antiguo.inspect}.Usuario Responsable: #{current_user.funcionario.full_name.inspect}.Datos Actualizados: Logo: #{logo_nuevo.inspect} , Nombre del Logo:#{nombre_logo_nuevo.inspect}, Nombre de la Empresa: #{nombre_empresa_nuevo.inspect}, Direccion:#{direccion_nueva.inspect}, RUC:#{ruc_nuevo.inspect}, Timbrado:#{timbrado_nuevo.inspect}, Fecha de Vencimiento de Timbrado:#{timbrado_vencimiento_nuevo.inspect}, Telefono: #{telefono_nuevo.inspect}, Telefono Auxiliar:#{telefono_auxiliar_nuevo.inspect}. Fecha y Hora: #{Time.now}")
         format.html { redirect_to @configuracion}
         format.json { head :no_content }
      else
        @configuracion = Configuracion.find(:all)
        CustomLogger.info("Error al intentar realizar la Actualizacion de los siguientes datos de la Configuracion de la Empresa: Logo: #{logo_antiguo.inspect} , Nombre del Logo:#{nombre_logo_antiguo.inspect}, Nombre de la Empresa: #{nombre_empresa_antiguo.inspect}, Direccion:#{direccion_antigua.inspect}, RUC:#{ruc_antiguo.inspect}, Timbrado:#{timbrado_antiguo.inspect}, Fecha de Vencimiento de Timbrado:#{timbrado_vencimiento_antiguo.inspect}, Telefono: #{telefono_antiguo.inspect}, Telefono Auxiliar:#{telefono_auxiliar_antiguo.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.html { render action: "edit" }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuracions/1
  # DELETE /configuracions/1.json
  def destroy
    @configuracion = Configuracion.find(params[:id])
    begin
      @configuracion.destroy
      notice= "Los datos de la Configuracion de la Empresa han sido eliminados"
      CustomLogger.info("Han sido eliminados los siguientes datos de la Configuracion de la Empresa: Logo: #{@configuracion.logo.inspect} , Nombre del Logo:#{@configuracion.nombre_logo.inspect}, Nombre de la Empresa: #{@configuracion.nombre_empresa.inspect}, Direccion:#{@configuracion.direccion.inspect}, RUC:#{@configuracion.ruc.inspect}, Timbrado:#{@configuracion.timbrado.inspect}, Fecha de Vencimiento de Timbrado:#{@configuracion.timbrado_vencimiento.inspect}, Telefono: #{@configuracion.telefono.inspect}, Telefono Auxiliar:#{@configuracion.telefono_auxiliar.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    rescue
      notice= "Los datos de la Configuracion de la Empresa no pueden ser eliminados"
      CustomLogger.info("No se pudo eliminar los siguientes datos de la Configuracion de la Empresa: Logo: #{@configuracion.logo.inspect} , Nombre del Logo:#{@configuracion.nombre_logo.inspect}, Nombre de la Empresa: #{@configuracion.nombre_empresa.inspect}, Direccion:#{@configuracion.direccion.inspect}, RUC:#{@configuracion.ruc.inspect}, Timbrado:#{@configuracion.timbrado.inspect}, Fecha de Vencimiento de Timbrado:#{@configuracion.timbrado_vencimiento.inspect}, Telefono: #{@configuracion.telefono.inspect}, Telefono Auxiliar:#{@configuracion.telefono_auxiliar.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    ensure
      respond_to do |format|
      format.html { redirect_to configuracions_url }
      format.json { head :no_content }
  end
  end
end
end
