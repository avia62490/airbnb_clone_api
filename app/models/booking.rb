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

  def are_dates_available
    
    overlapping_bookings = Booking.where(
      property_id: property.id
    ).where(
      "check_in_date < ? AND
      check_out_date > ?",
      check_out_date,
      check_in_date
    )

    if overlapping_bookings.length > 1
      false
    elsif overlapping_bookings.length == 1
      overlapping_bookings[0].id = id ? true : false
    else
      true
    end

  end

end
