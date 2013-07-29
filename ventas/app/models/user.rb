class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password,:id_funcionario
  belongs_to :funcionario, :foreign_key=>"id_funcionario"
  validates :username, :password, :presence => true
  validates :username, :uniqueness => { :message => "El usuario ya existe" }, :length => { :minimum => 6}, :format => { :with => /\A[a-zA-Z]+\z/}
  validates :password, :uniqueness => { :message => "Contrasena no disponible" }, :length => { :minimum => 6}
  has_many :roles_usuarios
  def self.rol_usuario(id_usuario)
  	rol_name=""
     rol_usuario=RolUsuario.find(:first,:conditions=>['id_usuario = ? ',id_usuario])
     rol=Rol.find(:first,:conditions=>['id = ?',rol_usuario.id_rol])
     rol_name=rol.rol
     return rol_name
  end
end