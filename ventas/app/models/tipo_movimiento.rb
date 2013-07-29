class TipoMovimiento < ActiveRecord::Base
	attr_accessible :descripcion
	has_many :movimientos_stocks
end
