#Requerido para obtener la Auditoria del ABM Producto:
require 'custom_logger'

class ClientesController < ApplicationController
    before_filter :require_login
  # GET /clientes
  # GET /clientes.json

  def index
    @clientes = Cliente.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cliente }
    end
  end 

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    @cliente = Cliente.new
    localidad_new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
    localidad_new
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])
    localidad_new
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Los datos del Cliente se han creado correctamente.'}
        CustomLogger.info("Se ha creado un nuevo Cliente: Datos: Nombre: #{@cliente.nombre.inspect} , Apellido:#{@cliente.apellido.inspect}, Nro de CI o RUC: #{@cliente.num_identidad.inspect}, Direccion:#{@cliente.direccion.inspect}, Telefono:#{@cliente.telefono.inspect}, Sexo:#{@cliente.sexo.inspect} y Localidad:#{@cliente.localidad.nombre}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @cliente, status: :created, location: @cliente }
        format.js   {render 'create'}
      else
        format.html { render action: "new" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])
    nombre_antiguo= @cliente.nombre
    apellido_antiguo= @cliente.apellido
    num_doc_antiguo= @cliente.num_identidad
    direccion_antigua= @cliente.direccion
    telefono_antiguo= @cliente.telefono
    sexo_antiguo= @cliente.sexo
    localidad_antigua= @cliente.localidad.nombre

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        nombre_nuevo= @cliente.nombre
        apellido_nuevo= @cliente.apellido
        num_doc_nuevo= @cliente.num_identidad
        direccion_nueva= @cliente.direccion
        telefono_nuevo= @cliente.telefono
        sexo_nuevo= @cliente.sexo
        localidad_nueva= @cliente.localidad.nombre
        CustomLogger.info("Datos antes de realizar la Actualizacion de Cliente: Nombre: #{nombre_antiguo.inspect}, Apellido:#{apellido_antiguo.inspect}, Nro de RUC o CI: #{num_doc_antiguo.inspect}, Direccion: #{direccion_antigua.inspect}, Sexo:#{sexo_antiguo.inspect}, Localidad:#{localidad_antigua.inspect} .Usuario Responsable: #{current_user.funcionario.full_name.inspect}.Datos Actualizados: Nombre:#{nombre_nuevo.inspect}, Apellido:#{apellido_nuevo.inspect}, Nro de RUC o CI:#{num_doc_nuevo.inspect}, Direccion:#{direccion_nueva.inspect}, Telefono:#{telefono_nuevo.inspect}, Sexo:#{sexo_nuevo.inspect} y Localidad:#{localidad_nueva.inspect}. Fecha y Hora: #{Time.now}")
        format.html { redirect_to @cliente, notice: 'Los datos del Cliente se han actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    begin
    @cliente.destroy
    notice= "Los datos del Cliente han sido eliminados"
      CustomLogger.info("Han sido eliminados los siguientes datos del Cliente: Nombre:#{@cliente.nombre.inspect}, Apellido:#{@cliente.apellido.inspect}, Nro de CI o RUC: #{@cliente.num_identidad.inspect}, Direccion:#{@cliente.direccion.inspect}, Telefono:#{@cliente.telefono.inspect}, Sexo:#{@cliente.sexo.inspect} y Localidad:#{@cliente.localidad.nombre}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    rescue
      notice= "Los datos del Cliente no pueden ser elimindados"
      CustomLogger.info("No se pudo eliminar los siguientes datos del Cliente: Nombre: #{@cliente.nombre.inspect}, Apellido:#{@cliente.apellido.inspect}, Nro de CI o RUC: #{@cliente.num_identidad.inspect}, Direccion:#{@cliente.direccion.inspect}, Telefono:#{@cliente.telefono.inspect}, Sexo:#{@cliente.sexo.inspect} y Localidad:#{@cliente.localidad.nombre}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    ensure
      respond_to do |format|
      format.html { redirect_to clientes_url }
      format.json { head :no_content }
    end
  end
  end

  def localidad_new
      @localidad= Localidad.new
      @departamentos=Departamento.all
     
  end
  def funcionario_create
      @localidad = Localidad.new(params[:funcionario])
       @departamentos=Departamento.all
      if @localidad.save
        flash[:notice] = "La Localidad creada se ha guardado correctamente"
      else
        flash[:notice] = "Se produjo inconvenientes al guardar los datos de la Localidad"
      end
  end

end
