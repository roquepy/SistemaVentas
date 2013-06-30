#Requerido para obtener la Auditoria del ABM Producto:
require 'custom_logger'

class ProductosController < ApplicationController
    before_filter :require_login
  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
      format.pdf { render :layout => false }
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = Producto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/new
  # GET /productos/new.json
  def new
    @producto = Producto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/1/edit
  def edit
    @producto = Producto.find(params[:id])
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(params[:producto])
    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Los datos del producto se han creado correctamente'}
        CustomLogger.info("Se ha creado un nuevo Producto: Datos: Codigo: #{@producto.codigo.inspect} , Descripcion:#{@producto.descripcion.inspect}, Cantidad Minima: #{@producto.cant_minima.inspect}, Cantidad Optima: #{@producto.cant_optima.inspect}, Precio Unitario: #{@producto.precio_unitario.inspect}, Porcentaje IVA: #{@producto.porcentaje.inspect}.Usuario Responsable:#{current_user.funcionario.full_name.inspect}, Fecha y Hora: #{Time.now}")
        format.json { render json: @producto, status: :created, location: @producto }
      else
        format.html { render action: "new" }
        CustomLogger.error("Error al intentar Crear un Nuevo Producto. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productos/1
  # PUT /productos/1.json
  def update
    @producto = Producto.find(params[:id])

    codigo_antiguo= @producto.codigo
    descripcion_antigua= @producto.descripcion
    cant_minima_antigua= @producto.cant_minima
    cant_optima_antigua= @producto.cant_optima
    precio_unitario_antiguo= @producto.precio_unitario
    porcentaje_iva_antiguo= @producto.porcentaje
    
    respond_to do |format|
      if @producto.update_attributes(params[:producto])
        codigo_nuevo= @producto.codigo
        descripcion_nueva= @producto.descripcion
        cant_minima_nueva= @producto.cant_minima
        cant_optima_nueva= @producto.cant_optima
        precio_unitario_nuevo= @producto.precio_unitario
        porcentaje_iva_nuevo= @producto.porcentaje
        CustomLogger.info("Datos antes de realizar la Actualizacion del Producto: Codigo: #{codigo_antiguo.inspect}, Descripcion:#{descripcion_antigua.inspect}, Cantidad Minima: #{cant_minima_antigua.inspect}, Cantidad Optima: #{cant_optima_antigua.inspect}, Precio Unitario:#{precio_unitario_antiguo.inspect}, Porcentaje IVA:#{porcentaje_iva_antiguo.inspect} .Usuario Responsable: #{current_user.funcionario.full_name.inspect}.Datos Actualizados: Codigo: #{codigo_nuevo.inspect}, Descripcion: #{descripcion_nueva.inspect}, Cantidad Minima: #{cant_minima_nueva.inspect}, Cantidad Optima: #{cant_optima_nueva.inspect}, Precio Unitario: #{precio_unitario_nuevo.inspect} y Porcentaje IVA: #{porcentaje_iva_nuevo.inspect}. Fecha y Hora: #{Time.now}")
        format.html { redirect_to @producto, notice: 'Los datos del producto se han actualizado correctamente' }
        format.json { head :no_content }
      else
        CustomLogger.error("Error al intentar realizar la Actualizacion de los siguientes datos del Producto: Codigo: #{codigo_antiguo.inspect}, Descripcion:#{descripcion_antigua.inspect}, Cantidad Minima: #{cant_minima_antigua.inspect}, Cantidad Optima: #{cant_optima_antigua.inspect}, Precio Unitario:#{precio_unitario_antiguo.inspect}, Porcentaje IVA:#{porcentaje_iva_antiguo.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.html { render action: "edit" }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto = Producto.find(params[:id])
    begin
      @producto.destroy
      notice= "Los datos del Producto han sido eliminados"
      CustomLogger.info("Han sido eliminados los siguientes datos del Producto: Codigo:#{@producto.codigo.inspect}, Descripcion:#{@producto.descripcion}, Cantidad Minima:#{@producto.cant_minima.inspect}, Cantidad Optima:#{@producto.cant_optima.inspect}, Precio Unitario:#{@producto.precio_unitario.inspect} y Porcentaje IVA:#{@producto.porcentaje.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    rescue
      notice= "Los datos del producto no pueden ser elimindados"
      CustomLogger.error("No se pudo eliminar los siguientes datos del Producto: Codigo:#{@producto.codigo.inspect}, Descripcion:#{@producto.descripcion}, Cantidad Minima:#{@producto.cant_minima.inspect}, Cantidad Optima:#{@producto.cant_optima.inspect}, Precio Unitario:#{@producto.precio_unitario.inspect} y Porcentaje IVA:#{@producto.porcentaje.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    ensure
      respond_to do |format|
      format.html { redirect_to productos_url }
      format.json { head :no_content }
    end
  end
end
end
