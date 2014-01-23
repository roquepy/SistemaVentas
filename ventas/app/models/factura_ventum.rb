class FacturaVentum < ActiveRecord::Base
	
  attr_accessible :id_cliente,:id_condicion_pago,:id_tipo_valor,:id_funcionario,:monto_total,:fecha,:nro_factura,:total_descuento,:total_iva5,:total_iva10,:total_iva
    
    belongs_to :cliente, :foreign_key=>"id_cliente"
    belongs_to :condicion_de_pago, :foreign_key=>"id_condicion_pago"
    belongs_to :tipo_valor_pago, :foreign_key=>"id_tipo_valor"
    belongs_to :funcionario, :foreign_key=>"id_funcionario"
    has_many :detalle_factura_venta
    validates :monto_total,:numericality =>{:greater_than=>0.0}
    validates :id_cliente,:presence => true

    def  self.ultima_factura()
        return FacturaVentum.find(:last)
    end

    def  self.aumentar_nro_factura()
        factura_nro=100
    	factura=ultima_factura
    	if factura.blank?
    		factura_nro=100
    	    else
    	    	factura_nro=factura.nro_factura+1
                
    	end	
    	return factura_nro
    	
    end
      def  self.actual_nro_factura()
         factura_nro=100
        factura=ultima_factura
        if factura.blank?
           factura_nro=100
           else
              if (factura.monto_total==0.0)
                factura_nro=factura.nro_factura
                else
                   factura_nro=factura.nro_factura+1
              end    
        end 
      return factura_nro
      
    end
    def  self.id_factura()
        factura=ultima_factura
        if factura.blank?
          id_factura=""
          else
             id_factura=factura.id
        end
        return id_factura
        
    end
    def self.factura_id(nro_factura)
      factura=FacturaVentum.find(:last,:conditions=>['nro_factura = ? ',nro_factura])
      if factura.blank?
        factura_id=""
        else
        factura_id=factura.id
      end
      return factura_id
    end
    def  self.descuento()
       descuento=0.00
       detalles_factura_ventas=DetalleFacturaVentaAux.listas_productos
       if detalles_factura_ventas==nil
          else
          detalles_factura_ventas.each do |detalle_factura_venta|
            total=detalle_factura_venta.producto.precio_unitario*detalle_factura_venta.cantidad
             descuento=descuento+(total*detalle_factura_venta.descuento/100)
          end
        end  
        return descuento
       
    end

     def  self.factura_total_iva()
       return factura_total_iva5()+factura_total_iva10()
    end

     def  self.factura_total_iva10()
       total_iva10=0.00
       detalles_factura_ventas=DetalleFacturaVentaAux.listas_productos
       if detalles_factura_ventas==nil
          else
          detalles_factura_ventas.each do |detalle_factura_venta|
            if detalle_factura_venta.producto.porcentaje==10
             total_iva10=total_iva10+(detalle_factura_venta.producto.precio_unitario)*0.1
           end
          end
        end  
       return total_iva10
    end
    def  self.factura_total_iva5()
       total_iva5=0.00
       detalles_factura_ventas=DetalleFacturaVentaAux.listas_productos
       if detalles_factura_ventas==nil
          else
          detalles_factura_ventas.each do |detalle_factura_venta|
            if detalle_factura_venta.producto.porcentaje==5
                total_iva5=total_iva5+(detalle_factura_venta.producto.precio_unitario)*0.05
            end
          end
        end  
       return total_iva5
    end
     def  self.factura_monto_total()
       monto_total=0.00
       detalles_factura_ventas=DetalleFacturaVentaAux.listas_productos
       if detalles_factura_ventas==nil
          else
          detalles_factura_ventas.each do |detalle_factura_venta|
                monto_total=monto_total+(detalle_factura_venta.producto.precio_unitario*detalle_factura_venta.cantidad)
          end
        end  
       return monto_total-descuento
    end


end
