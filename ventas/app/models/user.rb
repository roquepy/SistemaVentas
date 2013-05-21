class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password,:id_funcionario
  belongs_to :funcionario, :foreign_key=>"id_funcionario"
  validates :username, :password, :presence => true
  validates :username, :uniqueness => { :message => "El usuario ya existe" }
  validates :password, :uniqueness => { :message => "La contrasena no disponible" }
<<<<<<< HEAD
  validates :username, :length => { :minimum => 5, :maximum => 15}, :format => { :with => /\A[a-zA-Z]+\z/}
   validates :password, :length => { :minimum => 5, :maximum => 15}
=======
  validates :username, :length => { :minimum => 6, :maximum => 20}, :format => { :with => /\A[a-zA-Z]+\z/}
   validates :password, :length => { :minimum => 6, :maximum => 18}
>>>>>>> ef9a1a4463aa1a09a1bbe1fc8c559bac66b9ae35
   def self.buscar(buscar,page)
   	 User.paginate :page => page, :per_page => 2, :conditions=>['username like ? ',"%#{buscar}%"], :order => "username"
     
   end
end
