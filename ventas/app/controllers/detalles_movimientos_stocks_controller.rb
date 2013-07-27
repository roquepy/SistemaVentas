class DetallesMovimientosStocksController < ApplicationController
  # GET /detalles_movimientos_stocks
  # GET /detalles_movimientos_stocks.json
  def index
    @detalles_movimientos_stocks = DetalleMovimientoStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalles_movimientos_stocks }
    end
  end

  # GET /detalles_movimientos_stocks/1
  # GET /detalles_movimientos_stocks/1.json
  def show
    @movimiento_stock = MovimientoStock.find(:last)
    @detalles_movimientos_stocks=DetalleMovimientoStock.find(:all,:conditions=>['id_movimiento_stock = ? ',@movimiento_stock.id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detalle_movimiento_stock }
    end
  end

  # GET /detalles_movimientos_stocks/new
  # GET /detalles_movimientos_stocks/new.json
  def new
    @detalle_movimiento_stock = DetalleMovimientoStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detalle_movimiento_stock }
    end
  end

  # GET /detalles_movimientos_stocks/1/edit
  def edit
    @detalle_movimiento_stock = DetalleMovimientoStock.find(params[:id])

  end

  # POST /detalles_movimientos_stocks
  # POST /detalles_movimientos_stocks.json
  def create
    @detalle_movimiento_stock = DetalleMovimientoStock.new(params[:detalle_movimiento_stock])

    respond_to do |format|
      if @detalle_movimiento_stock.save
        format.html { redirect_to @detalle_movimiento_stock, notice: 'Detalle movimiento stock was successfully created.' }
        format.json { render json: @detalle_movimiento_stock, status: :created, location: @detalle_movimiento_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @detalle_movimiento_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /detalles_movimientos_stocks/1
  # PUT /detalles_movimientos_stocks/1.json
  def update
    @detalle_movimiento_stock = DetalleMovimientoStock.find(params[:id])
    @cantidad_vieja=@detalle_movimiento_stock.cantidad
    @stock=Stock.find(:first,:conditions=>['id_stock = ? ',@detalle_movimiento_stock.id_stock])
    respond_to do |format|
      if @detalle_movimiento_stock.update_attributes(params[:detalle_movimiento_stock])
        @cantidad_nueva=@detalle_movimiento_stock.cantidad
        if @detalle_movimiento_stock.tipo_movimiento.descripcion=='entrada'
          @stock.update_attributes(:cantidad=>@stock.cantidad-(@cantidad_vieja-@cantidad_nueva))
          else
          @stock.update_attributes(:cantidad=>@stock.cantidad+(@cantidad_vieja-@cantidad_nueva))
        end    
        format.html { redirect_to @detalle_movimiento_stock, notice: 'Detalle movimiento stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @detalle_movimiento_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_movimientos_stocks/1
  # DELETE /detalles_movimientos_stocks/1.json
  def destroy
    @detalle_movimiento_stock = DetalleMovimientoStock.find(params[:id])
    @stock=Stock.find(:first,:conditions=>['id_stock = ? ',@detalle_movimiento_stock.id_stock])
    if @detalle_movimiento_stock.tipo_movimiento.descripcion=='entrada'
      @stock.update_attributes(:cantidad=>@stock.cantidad-@detalle_movimiento_stock.cantidad)
       else
      @stock.update_attributes(:cantidad=>@stock.cantidad+@detalle_movimiento_stock.cantidad)
    end   
    @detalle_movimiento_stock.destroy

    respond_to do |format|
      format.html { redirect_to detalles_movimientos_stocks_url }
      format.json { head :no_content }
    end
  end
end
