class EstadosFuncionario < ActiveRecord::Base
  attr_accessible :descripcion
   validates :descripcion, :length => { :minimum => 15, :maximum => 50}, :format => { :with => /\A[a-zA-Z]+\z/}
  has_many :funcionarios
end
