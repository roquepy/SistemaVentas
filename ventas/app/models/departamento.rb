class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  has_many :localidads
   validates :nombre, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z]+\z/}
end
