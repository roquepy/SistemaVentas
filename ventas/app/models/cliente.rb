class Cliente < ActiveRecord::Base
  attr_accessible :num_identidad,:nombre, :apellido,:direccion,:telefono,:sexo, :id_localidad

  belongs_to :localidad, :foreign_key=>"id_localidad"
  validates :nombre,:apellido,:num_identidad,:telefono, :presence => true
  validates :num_identidad, :length => { :minimum => 6}, :uniqueness => true, :format => { :with =>  /\d/}
  validates :nombre, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :apellido, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z]+\z/ }
  validates :direccion, :length => { :minimum => 5}
  validates :telefono, :length => { :minimum => 6}, :format => { :with =>  /^[0-9]{2,3}-? ?[0-9]{6,7}$/ }
   has_many :factura_venta
end
