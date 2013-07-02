class Configuracion < ActiveRecord::Base
	attr_accessible :nombre_logo, :logo, :nombre_empresa, :direccion, :telefono, :telefono_auxiliar, :ruc, :timbrado, :timbrado_vencimiento
   mount_uploader :logo, LogoUploader
   
   validates :nombre_logo,presence: true, :length => { :minimum => 2}, :format => { :with => /\A[a-zA-Z\s]+\z/ }
   validates :nombre_empresa,presence: true, :length => { :minimum => 4}, :format => { :with => /\A[a-zA-Z\s\d\.\-]+\z/}
   validates :direccion,presence: true, :length => { :minimum => 5}, :format => { :with => /\A[a-zA-Z\s\d\.\/]+\z/}
   validates :telefono,presence: true, :length => { :minimum => 6},:format => { :with => /^\d{3,4}\s\d{5,6}$/ }
   validates :telefono_auxiliar,presence: true, :length => { :minimum => 6}, :format => { :with => /^\d{3,4}\s\d{5,6}$/ }
   validates :ruc, presence: true,:length => { :minimum => 6}, :format => { :with => /\d\-/}
   validates :timbrado,presence: true, :length => { :minimum => 6}, :format => { :with => /\d/}
   validates :timbrado_vencimiento,presence: true, :length => { :minimum => 8}, :format => { :with => /\A\d{2}(\/|-)\d{2}(\/|-)\d{4}\Z/i }
end
