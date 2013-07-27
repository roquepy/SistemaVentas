class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password,:id_funcionario
  belongs_to :funcionario, :foreign_key=>"id_funcionario"
  validates :username, :password, :presence => true
  validates :username, :uniqueness => { :message => "El usuario ya existe" }, :length => { :minimum => 6}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :password, :uniqueness => { :message => "Contrasena no disponible" }, :length => { :minimum => 6}
  has_many :roles_usuarios
end