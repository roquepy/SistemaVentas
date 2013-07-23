class Funcionario < ActiveRecord::Base
  attr_accessible :num_identidad,:nombres, :apellidos,:direccion,:telefono,:estado_civil,:sexo,:id_localidad,:id_estado_funcionario,:id_funcion
  belongs_to :localidad, :foreign_key=>"id_localidad"
  belongs_to :estados_funcionario, :foreign_key=>"id_estado_funcionario"
  belongs_to :funcion, :foreign_key=>"id_funcion"
  has_many :users
  has_many :factura_venta
  validates :num_identidad,presence: true, :length => { :minimum => 6}, :uniqueness => {:message => "El funcionario con este Nro de Documento ya se encuentra registrado"}, :format => { :with => /\d\-|\d\./}
  validates :nombres, presence: true,:length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s]+\z/ }
  validates :apellidos,presence: true, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s]+\z/ }
  validates :direccion,presence: true,  :length => { :minimum =>3}, :format => { :with => /\A[a-zA-Z\s\d\.\/]+\z/}
  validates :telefono,presence: true, :length => { :minimum => 6}, :format => { :with => /^\d{3,4}\s\d{5,6}$/ }

  def full_name
   self.nombres.capitalize + ' ' + self.apellidos.capitalize
  end
  def self.funcionario_id()
     funcionario=Funcionario.find(:first)
     return funcionario.id
  end
end