class AddForeignKey < ActiveRecord::Migration
  def change
  	add_foreign_key(:stock, :depositos, column: 'id_deposito')
  end
end
