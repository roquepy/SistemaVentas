class Departamento < ActiveRecord::Base
  attr_accessible :nombre
  has_many :localidads
   validates :nombre,presence: true, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s\.]+\z/ },:uniqueness =>{:message => "Este Departamento ya esta registrado en el sistema"}
end
