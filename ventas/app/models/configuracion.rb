class Configuracion < ActiveRecord::Base
	attr_accessible :nombre_logo, :logo
   mount_uploader :logo, ImageUploader
end
