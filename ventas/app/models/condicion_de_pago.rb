class CondicionDePago < ActiveRecord::Base
   attr_accessible :nombre_condicion_de_pago
    has_many :factura_venta
end
