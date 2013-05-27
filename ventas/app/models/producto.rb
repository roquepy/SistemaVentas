class Producto < ActiveRecord::Base
	attr_accessible :codigo,:descripcion, :cant_minima,:cant_optima,:precio_unitario,:porcentaje
  validates :codigo, :presence => true
  validates :codigo, :length => { :minimum => 6, :maximum => 10}, :uniqueness => true, :format => { :with => /\A[+-]?\d+\Z/}
  validates :descripcion, :length => { :minimum => 2, :maximum => 50}
  validates :cant_minima, :length => { :minimum => 2, :maximum => 50}
  validates :cant_optima, :length => { :minimum => 5, :maximum => 70 }
  validates :precio_unitario, :length => { :minimum => 6, :maximum => 15}
   validates :porcentaje, :length => { :minimum => 6, :maximum => 15}
	has_many :detalle_factura_venta
end
