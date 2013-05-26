class FacturaVentum < ActiveRecord::Base
	attr_accessible :id_cliente,:id_condicion_pago,:id_tipo_valor,:id_funcionario,:monto_total,:fecha,:nro_factura,:total_descuento,:total_iva5,:total_iva10,:total_iva
    belongs_to :cliente, :foreign_key=>"id_cliente"
    belongs_to :condicion_de_pago, :foreign_key=>"id_condicion_pago"
    belongs_to :tipo_valor_pago, :foreign_key=>"id_tipo_valor"
    belongs_to :funcionario, :foreign_key=>"id_funcionario"
    has_many :detalle_fatura_ventum
    def  self.obtener_nro_factura()
    	factura_nro=FacturaVentum.select("MAX(nro_factura)").from("factura_venta")
        #factura_nro=find_by_sql("<<-SQL select max(nro_factura) from factura_venta SQL")
    	if factura_nro.blank?
    		factura_nro=100
    	    else
    	    	factura_nro
                
    	end	
    	return factura_nro
    	
    end
     def  self.descuento(nrofactura)
        descuento=FacturaVentum.where('SELECT SUM(((p.precio_unitario*fd.cantidad)* fd.descuento)/100)
          FROM factura_venta AS fv INNER JOIN detalle_factura_venta AS 
          fd ON fv.id=fd.id_factura_venta INNER JOIN productos AS p ON fd.id_producto=p.id 
          WHERE fv.nro_factura="%#{nro_factura}%"')
        if  descuento.blank?
             descuento=0.00
        end 
        return  descuento   
    end

     def  self.factura_total_iva(nro_factura)
        total_iva=FacturaVentum.where('SELECT SUM(p.precio_unitario*fd.cantidad)  
            FROM factura_venta AS fv INNER JOIN detalle_factura_venta 
            AS fd ON fv.id=fd.id_factura_venta INNER JOIN productos AS p 
            ON fd.id_producto=p.id WHERE fv.nro_factura="%#{nro_factura}%"')
        if total_iva.blank?
            total_iva=0.00
        end 
        return total_iva-descuento(nro_factura)
        
    end

     def  self.factura_total_iva10(nrofactura)
        total_iva10=(factura_total_iva(nrofactura)*10)/100
         if total_iva10.blank?
            total_iva10=0.00
        end 
        return total_iva10
    end
    def  self.factura_total_iva5(nro_factura)
        total_iva5=(factura_total_iva(nro_factura)*5)/100
         if total_iva5.blank?
            total_iva5=0.00
        end 
        return total_iva5
    end


end
