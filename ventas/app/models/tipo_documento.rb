class TipoDocumento < ActiveRecord::Base
	attr_accessible :descripcion
	has_many :detalles_libros_cajas
end
