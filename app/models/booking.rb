class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

  def date_range
    (check_in_date..check_out_date).to_a
  end
end
