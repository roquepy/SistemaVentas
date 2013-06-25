class CreateTiposDocumentos < ActiveRecord::Migration
  def change
    create_table :tipos_documentos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
