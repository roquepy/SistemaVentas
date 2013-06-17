class Configuracion < ActiveRecord::Base
	attr_accessible :nombre_logo, :logo, :nombre_empresa, :direccion, :telefono, :telefono_auxiliar, :ruc, :timbrado, :timbrado_vencimiento
   mount_uploader :logo, ImageUploader
   validates :nombre_logo, :logo, :nombre_empresa, :direccion, :telefono, :ruc, :timbrado, :timbrado_vencimiento, :presence => true
   validates :nombre_logo, :length => { :minimum => 2}
   validates :nombre_empresa, :length => { :minimum => 4}
   validates :direccion, :length => { :minimum => 5}
   validates :telefono, :length => { :minimum => 6}
   validates :telefono_auxiliar, :length => { :minimum => 6}
   validates :ruc, :length => { :minimum => 6}
   validates :timbrado, :length => { :minimum => 6}
   validates :timbrado_vencimiento, :length => { :minimum => 6}
end
