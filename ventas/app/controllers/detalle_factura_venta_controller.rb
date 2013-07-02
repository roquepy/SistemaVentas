class DetalleFacturaVentaController < ApplicationController
    before_filter :require_login
    autocomplete :producto, :descripcion, :extra_data => [:id,:descripcion] ,:display_value => :producto_descripcion
  # GET /detalle_factura_venta
  # GET /detalle_factura_venta.json
  def index
    @detalle_factura_venta = DetalleFacturaVentum.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalle_factura_venta }
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
    @id=@detalle_factura_ventum.id
     @producto_id=@detalle_factura_ventum.producto.id
    @producto=@detalle_factura_ventum.producto.descripcion
    @cantidad=@detalle_factura_ventum.cantidad
    @descuento=@detalle_factura_ventum.descuento
    respond_to do |format|
      format.js {render 'edit'}
      
    end
 
  end


  # POST /detalle_factura_venta

  # POST /detalle_factura_venta.json


  def create
  if  FacturaVentum.factura_id(FacturaVentum.actual_nro_factura())==""
      @factura_ventum = FacturaVentum.new(:id_cliente=>Cliente.cliente_id(),:id_condicion_pago=>1,:id_tipo_valor=>1,:id_funcionario=>Funcionario.funcionario_id(),:monto_total=>0.0,:fecha=>Date.today,:nro_factura=>FacturaVentum.actual_nro_factura(),:total_descuento=>0.0,:total_iva5=>0.0,:total_iva10=>0.0,:total_iva=>0.0)
      @factura_ventum.save
    end
        @detalle_factura_ventum = DetalleFacturaVentum.new(:id_factura_venta=>params[:id_factura_venta],:id_producto=>params[:id_producto],:cantidad=>params[:cantidad],:descuento=>params[:descuento])
        respond_to do |format|
          if @detalle_factura_ventum.save
              @stock=Stock.find(:first ,:conditions=>['id_producto = ? ',@detalle_factura_ventum.id_producto])
             @stock=Stock.find(@stock.id)
             @stock.update_attributes(:cantidad=>@stock.cantidad-@detalle_factura_ventum.cantidad)
             @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
             format.js {render 'guardar'}
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
    @stock=Stock.find(:first ,:conditions=>['id_producto = ? ',@detalle_factura_ventum.id_producto])
    @cantidad_anterior=@detalle_factura_ventum.cantidad
    
     respond_to do |format|
      if @detalle_factura_ventum.update_attributes(:id_factura_venta=>params[:id_factura_venta],:id_producto=>params[:id_producto],:cantidad=>params[:cantidad],:descuento=>params[:descuento])
        @cantidad_actual=@detalle_factura_ventum.cantidad
        @diferencia=@cantidad_anterior-@cantidad_actual
        @stock.update_attributes(:cantidad=>@stock.cantidad+@diferencia)
        @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
         format.html { redirect_to detalle_factura_venta_url }
      format.json { head :no_content }
        format.js {render 'update'}
      else
        format.html { render action: "edit" }
        format.json { render json: @detalle_factura_ventum.errors, status: :unprocessable_entity }
      end
    end
  end
  def actualizar
      update
  end

  # DELETE /detalle_factura_venta/1
  # DELETE /detalle_factura_venta/1.json
  def destroy
    @detalle_factura_ventum = DetalleFacturaVentum.find(params[:id])
    @stock=Stock.find(:first ,:conditions=>['id_producto = ? ',@detalle_factura_ventum.id_producto])
    #@stock=Stock.find(@stock.id)
    @stock.update_attributes(:cantidad=>@stock.cantidad+@detalle_factura_ventum.cantidad)
    @detalle_factura_ventum.destroy
    respond_to do |format|
      format.html { redirect_to detalle_factura_venta_url }
      format.json { head :no_content }
      @detalles_factura_ventas = DetalleFacturaVentum.listas_productos
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
end
