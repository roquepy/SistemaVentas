class Configuracion < ActiveRecord::Base
	attr_accessible :nombre_logo, :logo, :nombre_empresa, :direccion, :telefono, :telefono_auxiliar, :ruc, :timbrado, :timbrado_vencimiento
   mount_uploader :logo, LogoUploader
   validates :nombre_logo, :nombre_empresa, :direccion, :telefono, :ruc, :timbrado, :timbrado_vencimiento, :presence => true
   validates :nombre_logo, :length => { :minimum => 2}, :format => { :with => /\A[a-zA-Z\s]+\z/ }
   validates :nombre_empresa, :length => { :minimum => 4}, :format => { :with => /\A[a-zA-Z\s\d\.\-]+\z/}
   validates :direccion, :length => { :minimum => 5}, :format => { :with => /\A[a-zA-Z\s\d\.\/]+\z/}
   validates :telefono, :length => { :minimum => 6},:format => { :with => /^\d{3,4}\s\d{5,6}$/ }
   validates :telefono_auxiliar, :length => { :minimum => 6}, :format => { :with => /^\d{3,4}\s\d{5,6}$/ }
   validates :ruc, :length => { :minimum => 6}, :format => { :with => /\d\-|\d\.|\d/}
   validates :timbrado, :length => { :minimum => 6}, :format => { :with => /\d/}
   validates :timbrado_vencimiento, :length => { :minimum => 8}, :format => { :with => /\A\d{2}(\/|-)\d{2}(\/|-)\d{4}\Z/i }
end
