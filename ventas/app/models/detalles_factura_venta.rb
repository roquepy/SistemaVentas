class DetallesFacturaVenta < ActiveRecord::Base
  attr_accessible :id_factura_venta,:id_producto,:cantidad,:descuento
   belongs_to :facturas_venta, :foreign_key=>"id_factura_venta"
   belongs_to :producto, :foreign_key=>"id_producto"
end
