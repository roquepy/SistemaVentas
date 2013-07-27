class DetalleMovimientoStock < ActiveRecord::Base
	attr_accessible :id_movimiento_stock,:id_stock,:cantidad
   belongs_to :movimiento_stock, :foreign_key=>"id_movimiento_stock"
   belongs_to :stock, :foreign_key=>"id_stock"
end
