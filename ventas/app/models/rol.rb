class Rol < ActiveRecord::Base
	attr_accessible :rol
	 has_many :roles_usuarios
end
