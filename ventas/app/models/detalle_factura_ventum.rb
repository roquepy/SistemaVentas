class DetalleFacturaVentum < ActiveRecord::Base
   attr_accessible :id_factura_venta,:id_producto,:cantidad,:descuento
   belongs_to :factura_ventum, :foreign_key=>"id_factura_venta"
   belongs_to :producto, :foreign_key=>"id_producto"
end
