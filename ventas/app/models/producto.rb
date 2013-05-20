class Producto < ActiveRecord::Base
	has_many :detalle_factura_venta
end
