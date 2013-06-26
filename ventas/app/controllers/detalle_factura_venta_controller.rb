class DetalleFacturaVentaController < ApplicationController
    before_filter :require_login
    autocomplete :producto, :descripcion,:full => true
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
    @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detalle_factura_ventum }
    end
  end

  # GET /detalle_factura_venta/1/edit
  def edit
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])
  end


  # POST /detalle_factura_venta

  # POST /detalle_factura_venta.json


  def create
  end
  def guardar
    @detalle_factura_ventum = DetalleFacturaVentum.new(:id_factura_venta=>params[:id_factura_venta],:id_producto=>params[:id_producto],:cantidad=>params[:cantidad],:descuento=>params[:descuento])
    respond_to do |format|
      if @detalle_factura_ventum.save
        @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
           format.js {render 'guardar'}
      else
        format.html { render action: "new" }
        format.json { render json: @detalle_factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end
    def guardar_agregar
    @detalle_factura_ventum = DetalleFacturaVentum.new(:id_factura_venta=>params[:id_factura_venta],:id_producto=>params[:id_producto],:cantidad=>params[:cantidad],:descuento=>params[:descuento])
    respond_to do |format|
      if @detalle_factura_ventum.save
        @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
           format.js {render 'guardar_agregar'}
      else
        format.html { render action: "new" }
        format.json { render json: @detalle_factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # 
  # PUT /detalle_factura_venta/1
  # PUT /detalle_factura_venta/1.json
  def update
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])
    respond_to do |format|
      if @detalle_factura_ventum.update_attributes(params[:detalle_factura_ventum])
        @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
        format.html { redirect_to @detalle_factura_ventum, notice: 'Detalle factura ventum was successfully updated.' }
        format.json { head :no_content }
        format.js {render 'update'}
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
      @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
      format.html { redirect_to detalle_factura_venta_url }
      format.json { head :no_content }
      format.js{render 'delete'}
    end
  end

end
