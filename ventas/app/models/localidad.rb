class Localidad < ActiveRecord::Base
  attr_accessible :nombre,:id_departamento
  has_many :funcionarios
  has_many :clientes
  belongs_to :departamento, :foreign_key=>"id_departamento"
  validates :nombre, :length => { :minimum => 3}, :format => { :with => /\A[a-zA-Z\s\.]+\z/ }
end
