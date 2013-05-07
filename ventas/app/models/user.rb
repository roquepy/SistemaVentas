class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password,:id_funcionario
  belongs_to :funcionario, :foreign_key=>"id_funcionario"
  validates :username, :password, :presence => true
  validates :username, :uniqueness => { :message => "El usuario ya existe" }
  validates :password, :uniqueness => { :message => "La contrasena no disponible" }
end
