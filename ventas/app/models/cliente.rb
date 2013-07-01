class Cliente < ActiveRecord::Base
  attr_accessible :num_identidad,:nombre, :apellido,:direccion,:telefono,:sexo, :id_localidad

  belongs_to :localidad, :foreign_key=>"id_localidad"

  validates :nombre,:apellido,:num_identidad,:telefono, :presence => true
  validates :num_identidad, :length => { :minimum => 6},:uniqueness =>{:message => "El cliente con este Nro de Documento ya se encuentra registrado"}, :format => { :with => /\d\-|\d\./}
  validates :nombre, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s]+\z/}
  validates :apellido, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s]+\z/}
  validates :direccion, :length => { :minimum => 5}, :format => { :with => /\A[a-zA-Z\s\d\.\/]+\z/}
  validates :telefono, :length => { :minimum => 6},  :format => { :with => /^\d{3,4}\s\d{5,6}$/ }

  has_many :factura_venta
  def self.cliente_id()
  	 cliente=Cliente.find(:first)
  	 return cliente.id
  end

end