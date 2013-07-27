class CreateRolesUsuarios < ActiveRecord::Migration
  def change
    create_table :roles_usuarios do |t|
      t.integer :id_rol,:null=>false
      t.integer :id_usuario,:null=>false
    end
  end
end
