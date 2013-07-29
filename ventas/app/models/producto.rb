class Producto < ActiveRecord::Base
	
  attr_accessible :codigo,:descripcion, :cant_minima,:cant_optima,:precio_unitario,:porcentaje
	
  	validates :codigo, :numericality =>{:message => "El campo de datos debe ser un numero"}
    validates :codigo, :presence => true,:length => { :minimum =>1}, numericality: {greater_than_or_equal_to:1} ,:uniqueness =>{:message => "Este codigo se encuentra registrado"}
    validates :descripcion,presence: true, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s\d\.\/]+\z/}
    validates :cant_minima,:numericality =>{:message => "El campo de datos debe ser un numero"}
  	validates :cant_minima,presence: true, :length => { :minimum => 1}, numericality: {greater_than_or_equal_to:1}
    validates :cant_minima,presence: true,:length => { :minimum => 1}, numericality: {less_than: :cant_optima}
    validates :cant_optima,:numericality =>{:message => "El campo de datos debe ser un numero"}
  	validates :cant_optima,presence: true, :length => { :minimum => 1}, numericality: {greater_than_or_equal_to:1}
    validates :cant_optima,presence: true, :length => { :minimum => 1}, numericality: {greater_than: :cant_minima}
    
    validates :precio_unitario,:numericality =>{:message => "El campo de datos debe ser un numero"}
  	validates :precio_unitario,presence: true, :length => { :minimum => 2}, numericality: {greater_than_or_equal_to:1}
    validates :porcentaje,presence: true, :length => { :minimum => 1}
    has_many :detalle_factura_venta
     has_many :detalles_facturas_ventas_auxs
    has_many :stock
    
    def self.obtenerProducto(id_producto)
      descripcion=" "
          producto=Producto.find(:first,:conditions=>['id = ? ',id_producto]) 
          if producto.blank?
            else
              descripcion=producto.descripcion 
          end
          
        return descripcion
    end

    def producto_descripcion
    "#{self.descripcion}"
    end
    def self.precio(id)
      producto=Producto.find(:first,:conditions=>['id = ? ',id])
      return producto.descripcion
    end



end
