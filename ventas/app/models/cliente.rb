class Cliente < ActiveRecord::Base
  attr_accessible :num_identidad,:nombre, :apellido,:direccion,:telefono,:sexo, :id_localidad

  belongs_to :localidad, :foreign_key=>"id_localidad"
  validates :nombre,:apellido,:num_identidad,:telefono, :presence => true
  validates :num_identidad, :length => { :minimum => 6, :maximum => 8}, :uniqueness => true
  validates :nombre, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :apellido, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :direccion, :length => { :minimum => 5, :maximum =>30}
  validates :telefono, :length => { :minimum => 6, :maximum => 13}
   has_many :factura_venta
def self.buscar(buscar,page)
  Cliente.paginate :page => page, :per_page => 2, :conditions=>['nombre like ? or direccion like ? or apellido like ?',"%#{buscar}%","%#{buscar}%","%#{buscar}%"], :order => "nombre"

 end
 def display_clientes
    self.id.to_s + ' - ' + self.nombre 
end
end
