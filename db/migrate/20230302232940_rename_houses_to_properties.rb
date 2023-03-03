class RenameHousesToProperties < ActiveRecord::Migration[7.0]
  def change
    rename_table :houses, :properties
  end
end
