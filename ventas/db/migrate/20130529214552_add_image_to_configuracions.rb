class AddImageToConfiguracions < ActiveRecord::Migration
  def change
    add_column :configuracions, :logo, :string

  end
end
