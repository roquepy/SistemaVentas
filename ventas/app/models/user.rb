class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password,:id_funcionario
  belongs_to :funcionario, :foreign_key=>"id_funcionario"
  validates :username, :password, :presence => true
  validates :username, :uniqueness => { :message => "El usuario ya existe" }
  validates :password, :uniqueness => { :message => "La contrasena no disponible" }
  validates :username, :length => { :minimum => 6, :maximum => 20}, :format => { :with => /\A[a-zA-Z]+\z/}
   validates :password, :length => { :minimum => 6, :maximum => 18}
   def self.buscar(buscar,page)
   	 User.paginate :page => page, :per_page => 2, :conditions=>['username like ? ',"%#{buscar}%"], :order => "username"
     
   end
end
