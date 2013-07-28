class Stock < ActiveRecord::Base
	
	 attr_accessible :id_deposito,:id_producto,:cantidad
	  
	  belongs_to :deposito, :foreign_key=>"id_deposito"
	  belongs_to :producto, :foreign_key=>"id_producto"
	  has_many :detalles_movimientos_stocks
      has_many :detalles_movimientos_stocks_auxs
      
end
