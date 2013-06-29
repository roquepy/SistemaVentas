class Producto < ActiveRecord::Base
	attr_accessible :codigo,:descripcion, :cant_minima,:cant_optima,:precio_unitario,:porcentaje
	
  	validates :codigo, :presence => true,:length => { :minimum =>1}, numericality: {greater_than_or_equal_to:1},:uniqueness =>{:message => "Este codigo se encuentra registrado"}
  	validates :descripcion, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s\d\.\/]+\z/}
  	validates :cant_minima, :length => { :minimum => 1}, numericality: {greater_than_or_equal_to:1}
    validates :cant_minima, :length => { :minimum => 1}, numericality: {less_than: :cant_optima}
  	validates :cant_optima, :length => { :minimum => 1}, numericality: {greater_than_or_equal_to:1}
    validates :cant_optima, :length => { :minimum => 1}, numericality: {greater_than: :cant_minima}
    
  	validates :precio_unitario, :length => { :minimum => 2}, numericality: {greater_than_or_equal_to:1}
    validates :porcentaje, :length => { :minimum => 1}
    has_many :detalle_factura_venta

    def self.obtenerProducto(id_producto)
      descripcion=" "
    	    producto=Producto.find(:first,:conditions=>['id = ? ',id_producto]) 
          if producto.blank?
            else
              descripcion=producto.descripcion 
          end
          
      	return descripcion
    end

end
