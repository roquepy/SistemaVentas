class Localidad < ActiveRecord::Base
  attr_accessible :nombre,:id_departamento
  has_many :funcionarios
  belongs_to :departamento, :foreign_key=>"id_departamento"
end
