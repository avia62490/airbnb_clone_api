class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.string :status, default: "requested"
      t.integer :sub_total
      t.integer :service_fee
      t.integer :total
      t.integer :user_id
      t.integer :property_id

      t.timestamps
    end
  end
end
