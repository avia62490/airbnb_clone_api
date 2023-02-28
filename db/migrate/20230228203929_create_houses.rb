class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.string :address
      t.text :description
      t.integer :price_rate
      t.integer :max_guests
      t.integer :bedrooms
      t.integer :bathrooms

      t.timestamps
    end
  end
end
