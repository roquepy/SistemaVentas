class TipoMovimiento < ActiveRecord::Base
	attr_accessible :descripcion
	has_many :movimientos_stocks
	has_many :detalles_libros_cajas
end
