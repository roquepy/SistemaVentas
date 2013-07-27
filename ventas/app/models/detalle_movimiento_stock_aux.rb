class DetalleMovimientoStockAux < ActiveRecord::Base
	 attr_accessible :id_stock,:cantidad
   belongs_to :stock, :foreign_key=>"id_stock"
	 def  self.listas_productos()
   	   productos=nil
   	   detalle_movimiento_stock_aux=DetalleMovimientoStockAux.find(:all)
   	   if detalle_movimiento_stock_aux.blank?
   	    else
	      productos=detalle_movimiento_stock_aux
   	   end
       return productos
    end
end
