class DetalleFacturaVentum < ActiveRecord::Base
   attr_accessible :id_factura_venta,:id_producto,:cantidad,:descuento
   
   belongs_to :factura_ventum, :foreign_key=>"id_factura_venta"
   belongs_to :producto, :foreign_key=>"id_producto"

   validates :cantidad, :numericality =>{:message => "El campo de datos debe ser un numero"}
   validates :cantidad, presence: true, :length => { :minimum => 1}, numericality: {greater_than_or_equal_to:1}

   def self.inicializar_detalle_factura_venta(_id_factura_venta,_id_producto,_cantidad,_descuento)
      id_factura_venta=_id_factura_venta
      id_producto=_id_producto
      cantidad=_cantidad
      descuento=_descuento

   end
    def  self.listas_productos()
   	   productos=nil
   	   id_factura=FacturaVentum.factura_id(FacturaVentum.actual_nro_factura)
   	   if id_factura.blank?
   	         
	   	   else
	          detalle_factura=DetalleFacturaVentum.find(:last,:conditions=>['id_factura_venta = ? ',id_factura])  
	          if detalle_factura.blank? 
                 productos=DetalleFacturaVentum.find(:all,:conditions=>['id_factura_venta = ? ',id_factura]) 
	             else
                 productos=DetalleFacturaVentum.find(:all,:conditions=>['id_factura_venta = ? ',id_factura])
            end
   	   end
       return productos
    end
end
