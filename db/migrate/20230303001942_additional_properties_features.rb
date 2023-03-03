class AdditionalPropertiesFeatures < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :service_fee, :integer
    add_column :properties, :type, :string
    add_column :properties, :hot_tub, :boolean, default: false
    add_column :properties, :pool, :boolean, default: false
    add_column :properties, :laundry, :boolean, default: false
    add_column :properties, :fireplace, :boolean, default: false
  end
end
