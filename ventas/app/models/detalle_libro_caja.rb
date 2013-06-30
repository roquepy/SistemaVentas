class DetalleLibroCaja < ActiveRecord::Base
	attr_accessible :id_libro_caja,:id_funcionario,:id_tipo_documento,:nro_asiento,:fecha,:descripcion,:ingreso,:egreso,:nro_documento
    belongs_to :libro_caja, :foreign_key=>"id_libro_caja"
    belongs_to :tipo_documento, :foreign_key=>"id_tipo_documento"
end
