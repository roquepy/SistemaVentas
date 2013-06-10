class Producto < ActiveRecord::Base
	attr_accessible :codigo,:descripcion, :cant_minima,:cant_optima,:precio_unitario,:porcentaje
  	validates :codigo, :presence => true
  	validates :codigo, :length => { :minimum => 3, :maximum => 10}, :uniqueness => true, :format => { :with => /\A[+-]?\d+\Z/}
  	validates :descripcion, :length => { :minimum => 3, :maximum => 50}
  	validates :cant_minima, :length => { :minimum => 1, :maximum => 4}
  	validates :cant_optima, :length => { :minimum => 1, :maximum => 4 }
  	validates :precio_unitario, :length => { :minimum => 3, :maximum => 10}
    validates :porcentaje, :length => { :minimum => 1, :maximum => 2}
	has_many :detalle_factura_venta
end
