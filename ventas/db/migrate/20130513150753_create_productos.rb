class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.integer :codigo ,  :null => false
      t.string :descripcion, :limit => 30,  :null => false
      t.integer :cant_minima,  :null => false
      t.integer :cant_optima,  :null => false
      t.decimal :precio_unitario,  :null => false
      t.integer :porcentaje,  :null => false
    end
  end
end
