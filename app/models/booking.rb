class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

  def date_range
    (check_in_date..check_out_date).to_a
  end

  def calculate_sub_total
    property.price_rate * (date_range.length - 1)
  end

  def calculate_service_fee
    property.service_fee
  end

  def calculate_total
    calculate_sub_total + calculate_service_fee
  end
end
