class CondicionDePago < ActiveRecord::Base
   attr_accessible :nombre_condicion_de_pago
  has_many :facturas_venta
end
