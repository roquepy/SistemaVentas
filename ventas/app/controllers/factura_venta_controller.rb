class FacturaVentaController < ApplicationController
    before_filter :require_login
  # GET /factura_venta
  # GET /factura_venta.json
  def index
    @factura_venta = FacturaVentum.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factura_venta }
    end
  end

  # GET /factura_venta/1
  # GET /factura_venta/1.json
  def show
    @factura_ventum = FacturaVentum.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura_ventum }
    end
  end

  # GET /factura_venta/new
  # GET /factura_venta/new.json
  def new
    @factura_ventum = FacturaVentum.new
    cliente_new
    detalle_factura_venta
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factura_ventum }
    end
  end

  # GET /factura_venta/1/edit
  def edit
    @factura_ventum = FacturaVentum.find(params[:id])
    detalle_factura_venta
  end

  # POST /factura_venta
  # POST /factura_venta.json
  def create
    @factura_ventum = FacturaVentum.new(params[:factura_ventum])
    detalle_factura_venta
    cliente_new
    respond_to do |format|
      if @factura_ventum.save
        format.html { redirect_to @factura_ventum, notice: 'Factura ventum was successfully created.' }
        format.json { render json: @factura_ventum, status: :created, location: @factura_ventum }
      else
        format.html { render action: "new" }
        format.json { render json: @factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factura_venta/1
  # PUT /factura_venta/1.json
  def update
    @factura_ventum = FacturaVentum.find(params[:id])

    respond_to do |format|
      if @factura_ventum.update_attributes(params[:factura_ventum])
        format.html { redirect_to @factura_ventum, notice: 'Factura ventum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_venta/1
  # DELETE /factura_venta/1.json
  def destroy
    @factura_ventum = FacturaVentum.find(params[:id])
    @factura_ventum.destroy

    respond_to do |format|
      format.html { redirect_to factura_venta_url }
      format.json { head :no_content }
    end
  end
 
  def detalle_factura_venta
      @detalle_factura_ventum  = DetalleFacturaVentum.new
      @detalles_factura_ventas = DetalleFacturaVentum.DetalleFacturaVentum.listas_productos
  end
  def cliente_new
      @cliente= Cliente.new
     
  end


end
