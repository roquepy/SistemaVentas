class MovimientoStock < ActiveRecord::Base
	attr_accessible :id_funcionario,:id_tipo_movimiento,:fecha,:descripcion
	belongs_to :funcionario, :foreign_key=>"id_funcionario"
    belongs_to :tipo_movimiento, :foreign_key=>"id_tipo_movimiento"
     has_many :detalles_movimientos_stocks
    validates :descripcion, :length => { :minimum => 7,:maximum => 25}, :format => { :with => /\A[a-zA-Z]+\z/}
end
