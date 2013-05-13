class DetallesFacturaVentaController < ApplicationController
  # GET /detalles_factura_venta
  # GET /detalles_factura_venta.json
  def index
    @detalles_factura_venta = DetallesFacturaVenta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalles_factura_venta }
    end
  end

  # GET /detalles_factura_venta/1
  # GET /detalles_factura_venta/1.json
  def show
    @detalles_factura_venta= DetallesFacturaVenta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detalles_factura_venta }
    end
  end

  # GET /detalles_factura_venta/new
  # GET /detalles_factura_venta/new.json
  def new
    @detalles_factura_venta= DetallesFacturaVenta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detalles_factura_venta}
    end
  end

  # GET /detalles_factura_venta/1/edit
  def edit
    @detalles_factura_venta = DetallesFacturaVenta.find(params[:id])
  end

  # POST /detalles_factura_venta
  # POST /detalles_factura_venta.json
  def create
    @detalles_factura_venta = DetallesFacturaVenta.new(params[:detalles_factura_venta])

    respond_to do |format|
      if @detalles_factura_venta.save
        format.html { redirect_to @detalles_factura_venta, notice: 'Se ha guardado correctamente el detalle de la factura' }
        format.json { render json: @detalles_factura_venta, status: :created, location: @detalles_factura_venta }
      else
        format.html { render action: "new" }
        format.json { render json: @detalles_factura_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /detalles_factura_venta/1
  # PUT /detalles_factura_venta/1.json
  def update
    @detalles_factura_venta = DetallesFacturaVenta.find(params[:id])

    respond_to do |format|
      if @detalles_factura_venta.update_attributes(params[:detalles_factura_venta])
        format.html { redirect_to @detalles_factura_venta, notice: 'Se ha actualizado correctamente el detalle de la factura' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @detalles_factura_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_factura_venta/1
  # DELETE /detalles_factura_venta/1.json
  def destroy
    @detalles_factura_venta= DetallesFacturaVenta.find(params[:id])
    @detalles_factura_venta.destroy

    respond_to do |format|
      format.html { redirect_to detalles_factura_venta_url }
      format.json { head :no_content }
    end
  end
end
