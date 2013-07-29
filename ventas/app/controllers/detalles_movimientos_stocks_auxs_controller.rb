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
    respond_to do |format|
      if @detalle_movimiento_stock_aux.update_attributes(:id_stock=>@detalle_movimiento_stock_aux.id_stock,:cantidad=>params[:cantidad])
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
  def cantidad_stock
    if params[:id_producto].blank?
      else
      @stock=Stock.find(:first ,:conditions=>['id_producto = ? ',params[:id_producto]])
      @cantidad=@stock.cantidad
      respond_to do |format|
        format.js{render 'cantidad_stock'}
      end
    end
  end
end
