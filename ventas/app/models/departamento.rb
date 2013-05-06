class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  has_many :localidads
end
