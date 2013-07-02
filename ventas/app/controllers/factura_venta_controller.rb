class FacturaVentaController < ApplicationController
    before_filter :require_login
    autocomplete :cliente, :nombre,:extra_data => [:id,:nombre],:display_value => :cliente_nombre
  # GET /factura_venta
  # GET /factura_venta.json
  def index

    @facturas_ventas = FacturaVentum.paginate(:page => params[:page], :per_page => 10)
    @empresa= Configuracion.find(:first)
    @nombreempresa = @empresa.nombre_empresa
    @logo = @empresa.logo
    @ruc = @empresa.ruc
    @timbrado = @empresa.timbrado
    @vencimiento = @empresa.timbrado_vencimiento
    @direccion = @empresa.direccion
    @telefono = @empresa.telefono

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factura_venta }
      format.pdf{render :layout => false}
    end
  end

  # GET /factura_venta/1
  # GET /factura_venta/1.json
  def show
    @factura_ventum = FacturaVentum.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura_ventum }
      format.pdf{render :layout => false}
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
     update
  end

  # PUT /factura_venta/1
  # PUT /factura_venta/1.json
  def update
    @factura=FacturaVentum.find(:last)
    @factura_ventum = FacturaVentum.find(@factura.id)
    respond_to do |format|
      if @factura_ventum.update_attributes(params[:factura_ventum])
        @factura_ventum.update_attributes(:total_descuento=>params[:total_descuento],:total_iva5=>params[:total_iva5],:total_iva10=>params[:total_iva10],:total_iva=>params[:total_iva],:monto_total=>params[:monto_total])
        @libro_caja=LibroCaja.find(:first)
        @tipo_documento=TipoDocumento.find(:first)
        @detalle_libro_caja=DetalleLibroCaja.new(:id_libro_caja=>@libro_caja.id,:id_funcionario=>@factura_ventum.id_funcionario,:id_tipo_documento=>@tipo_documento.id,:nro_asiento=>1,:fecha=>Date.today,:descripcion=>"Ventas de Mercaderias",:ingreso=>1,:egreso=>0,:nro_documento=>@factura_ventum.nro_factura)
        @detalle_libro_caja.save
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
     @factura_ventum.monto_total
     @detalles_factura_ventas = DetalleFacturaVentum.find(:all,:conditions=>['id_factura_venta = ? ',@factura_ventum.id])
     @detalles_factura_ventas.each  do |detalle_factura_venta|
     detalle_factura_venta.destroy
     end     
     @factura_ventum.destroy
    respond_to do |format|
      format.html { render "" }
      format.json { head :no_content }
    end
  end
 
  def detalle_factura_venta
      @detalle_factura_ventum  = DetalleFacturaVentum.new
      @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
  end
  def cliente_new
      @cliente= Cliente.new
     
  end
  def eliminar_factura
    
  end

end
