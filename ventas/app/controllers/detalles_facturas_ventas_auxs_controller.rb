class DetallesFacturasVentasAuxsController < ApplicationController
 before_filter :require_login
    autocomplete :producto, :descripcion, :extra_data => [:id,:descripcion] ,:display_value => :producto_descripcion
  # GET /detalle_factura_venta
  # GET /detalle_factura_venta.json
  def index
    @detalle_factura_venta_aux = DetalleFacturaVentaAux.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalle_factura_venta_aux }
    end
  end

  # GET /detalle_factura_venta/1
  # GET /detalle_factura_venta/1.json
  def show
    @detalle_factura_venta_aux=DetalleFacturaVentaAux.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detalle_factura_venta_aux}
    end
  end

  # GET /detalle_factura_venta/new
  # GET /detalle_factura_venta/new.json
  def new
    @detalle_factura_venta_aux= DetalleFacturaVentaAux.new
    @detalles_factura_ventas = DetalleFacturaVentaAux.listas_productos
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detalle_factura_venta_aux }
    end
  end

  # GET /detalle_factura_venta/1/edit
  def edit
    @detalle_factura_venta_aux = DetalleFacturaVentaAux.find(params[:id])
    @id=@detalle_factura_venta_aux.id
     @producto_id=@detalle_factura_venta_aux.producto.id
    @producto=@detalle_factura_venta_aux.producto.descripcion
    @cantidad=@detalle_factura_venta_aux.cantidad
    @descuento=@detalle_factura_venta_aux.descuento
    respond_to do |format|
      format.js {render 'edit'}
      
    end
 
  end


  # POST /detalle_factura_venta

  # POST /detalle_factura_venta.json


  def create
        @detalle_factura_venta_aux = DetalleFacturaVentaAux.new(:id_producto=>params[:id_producto],:cantidad=>params[:cantidad],:descuento=>params[:descuento])
        respond_to do |format|
          if @detalle_factura_venta_aux.save
            # CustomLogger.info("Se ha creado un Nuevo Detalle de Factura: Nro de Factura: #{@detalle_factura_ventum.factura_ventum.nro_factura.inspect}, Nombre del Producto: #{@detalle_factura_ventum.producto.descripcion.inspect}, Cantidad: #{@detalle_factura_ventum.cantidad.inspect}, Descuento: #{@detalle_factura_ventum.descuento.inspect}. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
              #@stock=Stock.find(:first ,:conditions=>['id_producto = ? ',@detalle_factura_venta_aux.id_producto])
             #@stock=Stock.find(@stock.id)
             #@stock.update_attributes(:cantidad=>@stock.cantidad-@detalle_factura_venta_aux.cantidad)
             @detalles_factura_ventas = DetalleFacturaVentaAux.listas_productos
             format.js {render 'guardar'}
          else
            format.html { render action: "new" }
            # CustomLogger.error("Error al intentar Crear un Nuevo Detalle de Factura. Usuario Responsable:#{current_user.funcionario.full_name.inspect}. Fecha y Hora: #{Time.now}")
            format.json { render json: @detalle_factura_venta_aux.errors, status: :unprocessable_entity }
          end
        end
  end

  # 
  # PUT /detalle_factura_venta/1
  # PUT /detalle_factura_venta/1.json
  def update
    @detalle_factura_venta_aux = DetalleFacturaVentaAux.find(params[:id])
    #@stock=Stock.find(:first ,:conditions=>['id_producto = ? ',@detalle_factura_venta_aux.id_producto])
    @cantidad_anterior=@detalle_factura_venta_aux.cantidad
    
     respond_to do |format|
      if @detalle_factura_venta_aux.update_attributes(:id_producto=>params[:id_producto],:cantidad=>params[:cantidad],:descuento=>params[:descuento])
       # @cantidad_actual=@detalle_factura_venta_aux.cantidad
        #@diferencia=@cantidad_anterior-@cantidad_actual
        #@stock.update_attributes(:cantidad=>@stock.cantidad+@diferencia)
        @detalles_factura_ventas = DetalleFacturaVentaAux.listas_productos
         format.html { redirect_to detalle_factura_venta_aux_url }
      format.json { head :no_content }
        format.js {render 'update'}
      else
        format.html { render action: "edit" }
        format.json { render json: @detalle_factura_venta_aux.errors, status: :unprocessable_entity }
      end
    end
  end
  def actualizar
      update
  end

  # DELETE /detalle_factura_venta/1
  # DELETE /detalle_factura_venta/1.json
  def destroy
    @detalle_factura_venta_aux = DetalleFacturaVentaAux.find(params[:id])
    #@stock=Stock.find(:first ,:conditions=>['id_producto = ? ',@detalle_factura_venta_aux.id_producto])
    #@stock=Stock.find(@stock.id)
    #@stock.update_attributes(:cantidad=>@stock.cantidad+@detalle_factura_venta_aux.cantidad)
     @detalle_factura_venta_aux.destroy
    respond_to do |format|
      format.html { redirect_to detalle_factura_venta_aux_url }
      format.json { head :no_content }
      @detalles_factura_ventas = DetalleFacturaVentaAux.listas_productos
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
  def precio_producto
    if params[:id_producto].blank?
      else
      @producto=Producto.find(:first ,:conditions=>['id = ? ',params[:id_producto]])
      @precio=@producto.precio_unitario
      respond_to do |format|
        format.js{render 'precio_producto'}
      end

    end
  end
end