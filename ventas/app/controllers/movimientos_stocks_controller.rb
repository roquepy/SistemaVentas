class MovimientosStocksController < ApplicationController
  # GET /movimientos_stocks
  # GET /movimientos_stocks.json
  def index
    @detalles_movimientos_stocks = DetalleMovimientoStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movimientos_stocks }
    end
  end

  # GET /movimientos_stocks/1
  # GET /movimientos_stocks/1.json
  def show
    @movimiento_stock = MovimientoStock.find(params[:id])
    @detalles_movimientos_stocks=DetalleMovimientoStock.find(:all,:conditions=>['id_movimiento_stock = ? ',@movimiento_stock.id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movimiento_stock }
    end
  end

  # GET /movimientos_stocks/new
  # GET /movimientos_stocks/new.json
  def new
    @movimiento_stock = MovimientoStock.new
    destroy_detalle_movimiento_stock_aux
    detalle_movimiento_stock_aux
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movimiento_stock }
    end
  end

  # GET /movimientos_stocks/1/edit
  def edit
    @movimiento_stock = MovimientoStock.find(params[:id])
  end

  # POST /movimientos_stocks
  # POST /movimientos_stocks.json
  def create
    @movimiento_stock = MovimientoStock.new(params[:movimiento_stock])
   #detalle_movimiento_stock_aux
    respond_to do |format|
      if @movimiento_stock.save
        CustomLogger.info("Se ha creado un Nuevo Movimiento Stock: Fecha: #{@movimiento_stock.fecha.inspect}, Tipo de Movimiento: #{@movimiento_stock.tipo_movimiento.descripcion.inspect},Descripcion: #{@movimiento_stock.descripcion.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        @movimiento_stock=MovimientoStock.find(:last)
        @detalles_movimientos_stocks_auxs=DetalleMovimientoStockAux.find(:all)

           @detalles_movimientos_stocks_auxs.each  do |detalle_movimiento_stock_aux|
           @detalle_movimiento_stock= DetalleMovimientoStock.new(:id_movimiento_stock=>@movimiento_stock.id,:id_stock=>detalle_movimiento_stock_aux.id_stock,:cantidad=>detalle_movimiento_stock_aux.cantidad)
           @detalle_movimiento_stock.save
           @stock=Stock.find(detalle_movimiento_stock_aux.id_stock)
           if  @movimiento_stock.tipo_movimiento.id == 1
               @stock.update_attributes(:cantidad=>@stock.cantidad+detalle_movimiento_stock_aux.cantidad)
             else
               @stock.update_attributes(:cantidad=>@stock.cantidad-detalle_movimiento_stock_aux.cantidad)
            end
        end
        destroy_detalle_movimiento_stock_aux
        format.html { redirect_to @movimiento_stock, notice: 'Movimiento stock was successfully created.' }
        format.json { render json: @movimiento_stock, status: :created, location: @movimiento_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @movimiento_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movimientos_stocks/1
  # PUT /movimientos_stocks/1.json
  def update
    @movimiento_stock = MovimientoStock.find(params[:id])
    respond_to do |format|
      if @movimiento_stock.update_attributes(params[:movimiento_stock])
        format.html { redirect_to @movimiento_stock, notice: 'Movimiento stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movimiento_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_stocks/1
  # DELETE /movimientos_stocks/1.json
  def destroy
    @movimiento_stock = MovimientoStock.find(params[:id])
    @detalles_movimientos_stocks = DetalleMovimientoStock.find(:all,:conditions=>['id_movimiento_stock = ? ',@movimiento_stock.id])
     @detalles_movimientos_stocks.each  do |detalle_movimiento_stock|
     detalle_movimiento_stock.destroy
     end
    @movimiento_stock.destroy
    CustomLogger.info("Se ha eliminado un  Movimiento Stock: Fecha: #{@movimiento_stock.fecha.inspect}, Tipo de Movimiento: #{@movimiento_stock.tipo_movimiento.descripcion.inspect},Descripcion: #{@movimiento_stock.descripcion.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
    respond_to do |format|
      format.html { redirect_to movimientos_stocks_url }
      format.json { head :no_content }
    end
  end
 def destroy_detalle_movimiento_stock_aux
     @detalles_movimientos_stocks_auxs=DetalleMovimientoStockAux.find(:all)
     @detalles_movimientos_stocks_auxs.each  do |detalle_movimiento_stock_aux|
        detalle_movimiento_stock_aux.destroy
      end
  end
  def detalle_movimiento_stock_aux
      @detalle_movimiento_stock_aux  = DetalleMovimientoStockAux.new
      @detalles_movimientos_stocks_auxs = DetalleMovimientoStockAux.listas_productos
  end
end
