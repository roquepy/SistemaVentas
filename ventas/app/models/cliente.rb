class Cliente < ActiveRecord::Base
  attr_accessible :num_identidad,:nombre, :apellido,:direccion,:telefono,:sexo,:id_localidad
  belongs_to :localidad, :foreign_key=>"id_localidad"
  validates :nombre,:apellido,:num_identidad,:telefono, :presence => true
  validates :num_identidad, :length => { :minimum => 9}
  validates :nombre, :length => { :minimum => 10}
  validates :apellido, :length => { :minimum => 10}
  validates :direccion, :length => { :minimum => 10}
  validates :telefono, :length => { :minimum => 9}


def self.buscar(buscar)
  if buscar
    find(:all, :conditions => ['nombre LIKE ?', "%#{buscar}%"])
  else
    find(:all)
  end
end


end
