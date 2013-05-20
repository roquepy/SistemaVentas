class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  has_many :localidads
   validates :nombre, :length => { :minimum => 2, :maximum => 50}, :format => { :with => /\A[a-zA-Z]+\z/}
  def self.buscar(buscar,page)
  	Departamento.paginate :page => page, :per_page => 2, :conditions=>['nombre like ? ',"%#{buscar}%"], :order => "nombre"
  end
end
