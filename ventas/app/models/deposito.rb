class Deposito < ActiveRecord::Base
	attr_accessible :nombre
	has_many :stock
end
