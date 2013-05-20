class Cliente < ActiveRecord::Base
  attr_accessible :num_identidad,:nombre, :apellido,:direccion,:telefono,:sexo,:id_localidad
  belongs_to :localidad, :foreign_key=>"id_localidad"
  validates :nombre,:apellido,:num_identidad,:telefono, :presence => true
  validates :num_identidad, :length => { :minimum => 6, :maximum => 10}, :uniqueness => true, :format => { :with => /\A[+-]?\d+\Z/}
  validates :nombre, :length => { :minimum => 2, :maximum => 50}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :apellido, :length => { :minimum => 2, :maximum => 50}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :direccion, :length => { :minimum => 5, :maximum => 70 }
  validates :telefono, :length => { :minimum => 6, :maximum => 15}, :format => { :with => /\((\d{3})\)\s+(\d{3})\s+(\d{3})/}
   has_many :factura_venta
def self.buscar(buscar,page)
  Cliente.paginate :page => page, :per_page => 2, :conditions=>['nombre like ? or direccion like ? or apellido like ?',"%#{buscar}%","%#{buscar}%","%#{buscar}%"], :order => "nombre"

end
end
