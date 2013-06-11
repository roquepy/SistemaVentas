class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.integer :codigo ,:limit => 6,:null => false
      t.string :descripcion, :limit => 50,  :null => false
      t.integer :cant_minima , :limit => 10,  :null => false
      t.integer :cant_optima , :limit => 10,  :null => false
      t.decimal :precio_unitario, :limit => 12,  :null => false
      t.integer :porcentaje , :limit => 2,  :null => false
    end
  end
end
