class DetalleFacturaVentaAux < ActiveRecord::Base
	attr_accessible :id_producto,:cantidad,:descuento
	 belongs_to :producto, :foreign_key=>"id_producto"
   def self.inicializar_detalle_factura_venta_aux(_id_producto,_cantidad,_descuento)
      id_producto=_id_producto
      cantidad=_cantidad
      descuento=_descuento

   end
    def  self.listas_productos()
   	   productos=nil
   	   detalle_factura_venta_aux=DetalleFacturaVentaAux.find(:all)
   	   if detalle_factura_venta_aux.blank?
   	    else
	      productos=detalle_factura_venta_aux
   	   end
       return productos
    end
end
