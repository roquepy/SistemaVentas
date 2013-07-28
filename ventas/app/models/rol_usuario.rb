class RolUsuario < ActiveRecord::Base
	
	attr_accessible :id_usuario,:id_rol
	
	belongs_to :usuario, :foreign_key=>"id_usuario"
	belongs_to :rol, :foreign_key=>"id_rol"
	
end
