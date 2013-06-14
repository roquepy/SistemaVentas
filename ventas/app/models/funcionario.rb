class Funcionario < ActiveRecord::Base
  attr_accessible :num_identidad,:nombres, :apellidos,:direccion,:telefono,:estado_civil,:sexo,:id_localidad,:id_estado_funcionario,:id_funcion
  belongs_to :localidad, :foreign_key=>"id_localidad"
  belongs_to :estados_funcionario, :foreign_key=>"id_estado_funcionario"
  belongs_to :funcion, :foreign_key=>"id_funcion"
  has_many :users
  has_many :factura_venta
  validates :nombres,:apellidos,:num_identidad,:telefono, :presence => true

  validates :num_identidad, :length => { :minimum => 6}
  validates :nombres, :length => { :minimum => 3},:format => { :with => /\A[a-zA-Z]+\z/}
  validates :apellidos, :length => { :minimum => 3},:format => { :with => /\A[a-zA-Z]+\z/}
  validates :direccion,  :length => { :minimum =>4},:format => { :with => /\A[a-zA-Z]+\z/}
  validates :telefono, :length => { :minimum => 6}, :format => { :with =>  /^[0-9]{2,3}-? ?[0-9]{6,7}$/ }
end