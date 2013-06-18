class DetalleFacturaVentaController < ApplicationController
    before_filter :require_login
  # GET /detalle_factura_venta
  # GET /detalle_factura_venta.json
  def index
    @detalle_factura_venta = DetalleFacturaVentum.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalle_factura_venta }
      format.js { }
    end
  end

  # GET /detalle_factura_venta/1
  # GET /detalle_factura_venta/1.json
  def show
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detalle_factura_ventum }
    end
  end

  # GET /detalle_factura_venta/new
  # GET /detalle_factura_venta/new.json
  def new
    @detalle_factura_ventum = DetalleFacturaVentum.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detalle_factura_ventum }
    end
  end

  # GET /detalle_factura_venta/1/edit
  def edit
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])
    respond_to do |format|
       format.js {render 'edit'}
     end
  end

  # POST /detalle_factura_venta
  # POST /detalle_factura_venta.json
  def create
    @detalle_factura_ventum = DetalleFacturaVentum.new(params[:detalle_factura_ventum])
    respond_to do |format|
      if @detalle_factura_ventum.save
        format.html { redirect_to @detalle_factura_ventum, notice: 'Detalle factura ventum was successfully created.' }
        format.json { render json: @detalle_factura_ventum, status: :created, location: @detalle_factura_ventum }
        format.js {render 'create'}
      else
        format.html { render action: "new" }
        format.json { render json: @detalle_factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end
  def guardar_agregar
    @detalle_factura_ventum= DetalleFacturaVentum.new(params[:detalle_factura_ventum])
    respond_to do |format|
      if @detalle_factura_ventum.save
        format.js { render 'guardar_agregar' }
      end
    end
  end

  # PUT /detalle_factura_venta/1
  # PUT /detalle_factura_venta/1.json
  def update
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])

    respond_to do |format|
      if @detalle_factura_ventum.update_attributes(params[:detalle_factura_ventum])
        format.html { redirect_to @detalle_factura_ventum, notice: 'Detalle factura ventum was successfully updated.' }
        format.json { head :no_content }
        format.js {}
      else
        format.html { render action: "edit" }
        format.json { render json: @detalle_factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_factura_venta/1
  # DELETE /detalle_factura_venta/1.json
  def destroy
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])
    @detalle_factura_ventum.destroy

    respond_to do |format|
      format.html { redirect_to detalle_factura_venta_url }
      format.json { head :no_content }
    end
  end

end
