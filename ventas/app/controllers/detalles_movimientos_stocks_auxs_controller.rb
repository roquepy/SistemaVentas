require 'custom_logger'
class DetallesMovimientosStocksAuxsController < ApplicationController
  before_filter :require_login
    autocomplete :producto, :descripcion, :extra_data => [:id,:descripcion] ,:display_value => :producto_descripcion

  # GET /detalles_movimientos_stocks_auxs
  # GET /detalles_movimientos_stocks_auxs.json
  def index
    @detalles_movimientos_stocks_auxs = DetalleMovimientoStockAux.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalles_movimientos_stocks_auxs }
    end
  end

  # GET /detalles_movimientos_stocks_auxs/1
  # GET /detalles_movimientos_stocks_auxs/1.json
  def show
    @detalle_movimiento_stock_aux = DetalleMovimientoStockAux.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detalle_movimiento_stock_aux }
    end
  end

  # GET /detalles_movimientos_stocks_auxs/new
  # GET /detalles_movimientos_stocks_auxs/new.json
  def new
    @detalle_movimiento_stock_aux = DetalleMovimientoStockAux.new
    @detalles_movimientos_stocks_auxs = DetalleMovimientoStockAux.listas_productos
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detalle_movimiento_stock_aux }
    end
  end

  # GET /detalles_movimientos_stocks_auxs/1/edit
  def edit
    @detalle_movimiento_stock_aux = DetalleMovimientoStockAux.find(params[:id])
     @id=@detalle_movimiento_stock_aux.id
     @producto_id=@detalle_movimiento_stock_aux.stock.producto.id
    @producto=@detalle_movimiento_stock_aux.stock.producto.descripcion
    @cantidad=@detalle_movimiento_stock_aux.cantidad
    
    respond_to do |format|
      format.js {render 'edit'}
      
    end
  end

  # POST /detalles_movimientos_stocks_auxs
  # POST /detalles_movimientos_stocks_auxs.json
  def create
    @stock=Stock.find(:first,:conditions=>['id_producto = ? ',params[:id_producto]])
    @detalle_movimiento_stock_aux = DetalleMovimientoStockAux.new(:id_stock=>@stock.id,:cantidad=>params[:cantidad])
   
    respond_to do |format|
      if @detalle_movimiento_stock_aux.save

        CustomLogger.info("Se ha creado un Nuevo Detalle Movimiento Stock: Producto: #{@detalle_movimiento_stock_aux.stock.producto.descripcion.inspect}, Cantidad: #{@detalle_movimiento_stock_aux.cantidad.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.html { redirect_to @detalle_movimiento_stock_aux, notice: 'Detalle movimiento stock aux was successfully created.' }
        format.json { render json: @detalle_movimiento_stock_aux, status: :created, location: @detalle_movimiento_stock_aux }
          @detalles_movimientos_stocks_auxs = DetalleMovimientoStockAux.listas_productos
          format.js {render 'create'}

      else
        format.html { render action: "new" }
        format.json { render json: @detalle_movimiento_stock_aux.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /detalles_movimientos_stocks_auxs/1
  # PUT /detalles_movimientos_stocks_auxs/1.json
  def update
    @detalle_movimiento_stock_aux = DetalleMovimientoStockAux.find(params[:id])
     @stock=Stock.find(:first,:conditions=>['id_producto = ? ',params[:id_producto]])
    producto_antiguo= @detalle_movimiento_stock_aux.stock.producto.descripcion
     cantidad_antiguo= @detalle_movimiento_stock_aux.cantidad
    respond_to do |format|
      if @detalle_movimiento_stock_aux.update_attributes(:id_stock=>@stock.id,:cantidad=>params[:cantidad])
        producto_nuevo= @detalle_movimiento_stock_aux.stock.producto.descripcion
        cantidad_nuevo= @detalle_movimiento_stock_aux.cantidad
        CustomLogger.info("Datos antes de realizar la Actualizacion del Detalle Movimiento Stock: Producto: #{producto_antiguo.inspect}, Cantidad:#{cantidad_antiguo.inspect} .Usuario Responsable: #{current_user.funcionario.full_name.inspect}.Datos Actualizados: Producto:#{producto_nuevo.inspect}, Cantidad:#{cantidad_nuevo.inspect}. Fecha y Hora: #{Time.now}")
        format.html { redirect_to @detalle_movimiento_stock_aux, notice: 'Detalle movimiento stock aux was successfully updated.' }
        format.json { head :no_content }
         @detalles_movimientos_stocks_auxs = DetalleMovimientoStockAux.listas_productos
        format.js {render 'update'}
      else
        format.html { render action: "edit" }
        format.json { render json: @detalle_movimiento_stock_aux.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_movimientos_stocks_auxs/1
  # DELETE /detalles_movimientos_stocks_auxs/1.json
  def destroy
    @detalle_movimiento_stock_aux = DetalleMovimientoStockAux.find(params[:id])
    @detalle_movimiento_stock_aux.destroy
     CustomLogger.info("Han sido eliminados los siguientes datos del Detalle Movimiento Stock: Producto:#{@detalle_movimiento_stock_aux.stock.producto.descripcion.inspect}, Cantidad:#{@detalle_movimiento_stock_aux.cantidad.inspect}. Usuario Responsable: #{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    respond_to do |format|
      format.html { redirect_to detalles_movimientos_stocks_auxs_url }
      format.json { head :no_content }
      @detalles_movimientos_stocks_auxs = DetalleMovimientoStockAux.listas_productos
      format.js{render 'delete'}
    end
  end
   def guardar_o_actualizar
      id=params[:id]
        if id.blank?
           create
         else
          update
         end
  end
  def cantidad_producto
    if params[:id_producto].blank?
      else
      @producto=Producto.find(:first ,:conditions=>['id= ? ',params[:id_producto]])
      @stock=Stock.find(:first ,:conditions=>['id_producto= ? ',params[:id_producto]])
      @cantidad_stock=@stock.cantidad
      @cantidad_minima=@producto.cant_minima
      @cantidad_optima=@producto.cant_optima
      respond_to do |format|
        format.js{render 'cantidad_producto'}
      end
    end
  end
end
