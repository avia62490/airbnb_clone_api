class RenamePhotosForeignKey < ActiveRecord::Migration[7.0]
  def change
    rename_column :photos, :house_id, :property_id
  end
end
