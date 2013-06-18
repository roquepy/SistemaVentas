class DetalleFacturaVentum < ActiveRecord::Base
   attr_accessible :id_factura_venta,:id_producto,:cantidad,:descuento
   belongs_to :factura_ventum, :foreign_key=>"id_factura_venta"
   belongs_to :producto, :foreign_key=>"id_producto"
    def  self.listas_productos()
   	   productos=nil
   	   ultima_factura=FacturaVentum.ultima_factura
   	   if ultima_factura.blank?
   	   
	   	   else
	   	   	  factura_id=ultima_factura.id
	          detalle_factura=DetalleFacturaVentum.find(:last,:conditions=>['id_factura_venta = ? ',factura_id])  
	          if detalle_factura.blank? 
                 productos=DetalleFacturaVentum.find(:all,:conditions=>['id_factura_venta = ? ',factura_id+1]) 
	             else
                 productos=DetalleFacturaVentum.find(:all,:conditions=>['id_factura_venta = ? ',factura_id+1])
            end
   	   end
       return productos
    end
end
