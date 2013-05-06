class EstadosFuncionario < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :funcionarios
end
