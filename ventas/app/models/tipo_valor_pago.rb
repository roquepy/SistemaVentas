class TipoValorPago < ActiveRecord::Base
   attr_accessible :descripcion
   has_many :facturas_venta
end
