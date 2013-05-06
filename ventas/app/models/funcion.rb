class Funcion < ActiveRecord::Base
  attr_accessible :nombre
  has_many :funcionarios
end
