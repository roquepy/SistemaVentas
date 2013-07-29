class LibroCaja < ActiveRecord::Base
	attr_accessible :nro_libro_caja,:fecha_inicio,:fecha_fin,:saldo_inicial,:saldo_final
	has_many :detalles_libros_cajas
end
