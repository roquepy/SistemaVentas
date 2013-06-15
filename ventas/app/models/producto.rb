class Producto < ActiveRecord::Base
	attr_accessible :codigo,:descripcion, :cant_minima,:cant_optima,:precio_unitario,:porcentaje
	
  	validates :codigo, :presence => true
  	validates :codigo, :length => { :minimum =>1}, :uniqueness => true
  	validates :descripcion, :length => { :minimum => 3},:format => { :with => /\A[a-zA-Z]+\z/}
  	validates :cant_minima, :length => { :minimum => 1}, :format => { :with =>  /\d/}
  	validates :cant_optima, :length => { :minimum => 1}, :format => { :with =>  /\d/}
  	validates :precio_unitario, :length => { :minimum => 2}, :format => { :with =>  /\d/}
    validates :porcentaje, :length => { :minimum => 1}
	  
    has_many :detalle_factura_venta
end
