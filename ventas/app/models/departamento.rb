class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  has_many :localidads
   validates :nombre, :length => { :minimum => 4, :maximum => 35}, :format => { :with => /\A[a-zA-Z]+\z/}
  def self.buscar(buscar,page)
  	Departamento.paginate :page => page, :per_page => 2, :conditions=>['nombre like ? ',"%#{buscar}%"], :order => "nombre"
  end
end
