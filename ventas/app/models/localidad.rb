class Localidad < ActiveRecord::Base
  attr_accessible :nombre,:id_departamento
  has_many :funcionarios
  has_many :clientes
  belongs_to :departamento, :foreign_key=>"id_departamento"
  validates :nombre, :length => { :minimum => 3, :maximum => 35}, :format => { :with => /\A[a-zA-Z]+\z/}
   def self.buscar(buscar,page)
  	Localidad.paginate :page => page, :per_page => 2, :conditions=>['nombre like ? ',"%#{buscar}%"], :order => "nombre"
  end
end
