#Requerido para obtener la Auditoria del ABM Producto:
require 'custom_logger'

class FacturaVentaController < ApplicationController
    before_filter :require_login
    autocomplete :cliente, :nombre,:extra_data => [:id,:nombre],:display_value => :cliente_nombre
  # GET /factura_venta
  # GET /factura_venta.json
  def index

    @facturas_ventas = FacturaVentum.paginate(:page => params[:page], :per_page => 10)
  

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
    destroy_detalle_factura_venta_aux
    detalle_factura_venta_aux
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factura_ventum }
    end
  end

  # GET /factura_venta/1/edit
  def edit
    @factura_ventum = FacturaVentum.find(params[:id])
    detalle_factura_venta_aux
  end

  # POST /factura_venta
  # POST /factura_venta.json
  def create
     @factura_ventum = FacturaVentum.new(params[:factura_ventum])
    respond_to do |format|
      if @factura_ventum.save
        @factura_venta=FacturaVentum.find(:last)
        @detalles_facturas_ventas_auxs=DetalleFacturaVentaAux.find(:all)

        @detalles_facturas_ventas_auxs.each  do |detalle_factura_venta_aux|
           @detalle_factura_venta= DetalleFacturaVentum.new(:id_factura_venta=>@factura_venta.id,:id_producto=>detalle_factura_venta_aux.id_producto,:cantidad=>detalle_factura_venta_aux.cantidad,:descuento=>detalle_factura_venta_aux.descuento)
           @detalle_factura_venta.save
           @stock=Stock.find(:first ,:conditions=>['id_producto = ? ',detalle_factura_venta_aux.id_producto])
           @stock=Stock.find(@stock.id)
           @stock.update_attributes(:cantidad=>@stock.cantidad-detalle_factura_venta_aux.cantidad)
        end
        destroy_detalle_factura_venta_aux
        format.html { redirect_to @factura_ventum, notice: 'Los datos de las Factura se han creado correctamente.'}
        #CustomLogger.info("Se ha creado un nuevo Cliente: Datos: Nombre: #{@cliente.nombre.inspect} , Apellido:#{@cliente.apellido.inspect}, Nro de CI o RUC: #{@cliente.num_identidad.inspect}, Direccion:#{@cliente.direccion.inspect}, Telefono:#{@cliente.telefono.inspect}, Sexo:#{@cliente.sexo.inspect} y Localidad:#{@cliente.localidad.nombre}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @factura_ventum, status: :created, location: @factura_ventum}
        format.js   {render 'create'}
      else
        format.html { render action: "new" }
        #CustomLogger.error("Error al intentar Crear un Nuevo Cliente. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        format.json { render json: @factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factura_venta/1
  # PUT /factura_venta/1.json
  def update
    @factura=FacturaVentum.find(:last)
    @factura_ventum = FacturaVentum.find(@factura.id)
    respond_to do |format|
      if @factura_ventum.update_attributes(params[:factura_ventum])
        @factura_ventum.update_attributes(:total_descuento=>params[:total_descuento],:total_iva5=>params[:total_iva5],:total_iva10=>params[:total_iva10],:total_iva=>params[:total_iva],:monto_total=>params[:monto_total])
        CustomLogger.info("Se ha creado una Nueva Factura de Ventas con los siguientes datos: Numero de Factura: #{@factura_ventum.nro_factura.inspect} , Cliente:#{@factura_ventum.cliente.nombre.inspect}, Funcionario: #{current_user.funcionario.full_name.inspect}, Fecha:#{@factura_ventum.fecha.inspect}, Condicion de Pago:#{@factura_ventum.condicion_de_pago.nombre_condicion_de_pago.inspect}, Tipo de Valor:#{@factura_ventum.tipo_valor_pago.descripcion.inspect}, Total IVA 5: #{@factura_ventum.total_iva5.inspect}, Total IVA 10: #{@factura_ventum.total_iva10.inspect}, Total IVA: #{@factura_ventum.total_iva.inspect}, Descuento: #{@factura_ventum.total_descuento.inspect} y Monto Total: #{@factura_ventum.monto_total}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
        @libro_caja=LibroCaja.find(:first)
        @tipo_documento=TipoDocumento.find(:first)
        @detalle_libro_caja=DetalleLibroCaja.new(:id_libro_caja=>@libro_caja.id,:id_funcionario=>@factura_ventum.id_funcionario,:id_tipo_documento=>@tipo_documento.id,:nro_asiento=>1,:fecha=>Date.today,:descripcion=>"Ventas de Mercaderias",:ingreso=>1,:egreso=>0,:nro_documento=>@factura_ventum.nro_factura)
        @detalle_libro_caja.save
        format.html { redirect_to @factura_ventum, notice: 'Factura ventum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        CustomLogger.error("Error al intentar Crear una Nueva Factura. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
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
       format.html { redirect_to factura_venta_url }
      format.json { render json: @factura_ventum }
    end
  end
 
  def detalle_factura_venta_aux
      @detalle_factura_venta_aux  = DetalleFacturaVentaAux.new
      @detalles_factura_ventas = DetalleFacturaVentaAux.listas_productos
  end
  def cliente_new
      @cliente= Cliente.new
     
  end
  def eliminar_factura
    
  end
  def view
      @empresa= Configuracion.find(:first)
    @nombreempresa = @empresa.nombre_empresa
    @logo = @empresa.logo
    @ruc = @empresa.ruc
    @timbrado = @empresa.timbrado
    @vencimiento = @empresa.timbrado_vencimiento
    @direccion = @empresa.direccion
    @telefono = @empresa.telefono
    @factura_venta= FacturaVentum.find(params[:id])
    @cliente=@factura_venta.cliente
    @detalles_factura_venta=DetalleFacturaVentum.find(:all,:conditions=>['id_factura_venta = ? ',@factura_venta.id])
 end
  def destroy_detalle_factura_venta_aux
     @detalles_facturas_ventas_auxs=DetalleFacturaVentaAux.find(:all)
     @detalles_facturas_ventas_auxs.each  do |detalle_factura_venta_aux|
        detalle_factura_venta_aux.destroy
      end
  end
end
