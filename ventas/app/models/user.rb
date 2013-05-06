class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :nombre, :clave,:id_funcionario
  belongs_to :funcionario, :foreign_key=>"id_funcionario"
  validates :nombre, :clave, :presence => true
  validates :nombre, :uniqueness => { :message => "El usuario ya existe" }
  validates :clave, :uniqueness => { :message => "La contrasena no disponible" }
end
