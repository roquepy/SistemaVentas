class FacturaVentum < ActiveRecord::Base
	attr_accessible :id_cliente,:id_condicion_pago,:id_tipo_valor,:id_funcionario,:anulado,:monto_total,:fecha,:nro_factura,:total_descuento,:total_iva5,:total_iva10,:total_iva
    belongs_to :cliente, :foreign_key=>"id_cliente"
    belongs_to :condicion_de_pago, :foreign_key=>"id_condicion_pago"
    belongs_to :tipo_valor_pago, :foreign_key=>"id_tipo_valor"
    belongs_to :funcionario, :foreign_key=>"id_funcionario"
    def  self.obtener_nro_factura()
    	factura_nro=where ('SELECT MAX(nro_factura)  FROM factura_venta')
    	if factura_nro.blank?
    		factura_nro=100
    	    else
    	    	factura_nro=factura_nro+1
    	end	
    	return factura_nro
    	
    end
end
