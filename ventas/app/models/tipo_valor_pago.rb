class TipoValorPago < ActiveRecord::Base
   attr_accessible :descripcion
   has_many :factura_venta
end
