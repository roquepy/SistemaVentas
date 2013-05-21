class Funcionario < ActiveRecord::Base
  attr_accessible :num_identidad,:nombres, :apellidos,:direccion,:telefono,:estado_civil,:sexo,:id_localidad,:id_estado_funcionario,:id_funcion
  belongs_to :localidad, :foreign_key=>"id_localidad"
  belongs_to :estados_funcionario, :foreign_key=>"id_estado_funcionario"
  belongs_to :funcion, :foreign_key=>"id_funcion"
  has_many :users
  has_many :factura_venta
  validates :nombres,:apellidos,:num_identidad,:telefono, :presence => true
  validates :num_identidad, :length => { :minimum => 9}
  validates :nombres, :length => { :minimum => 2, :maximum => 50}
  validates :apellidos, :length => { :minimum => 2, :maximum => 50}
  validates :direccion,  :length => { :minimum => 5, :maximum => 70 }
  validates :telefono, :length => { :minimum => 6, :maximum => 15}
end
