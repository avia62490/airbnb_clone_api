class BookingsController < ApplicationController
  # before_action :authenticate_user

  def create
    @booking = Booking.new(
      property_id: params[:property_id],
      user_id: params[:user_id],
      check_in_date: "2023-03-20",
      check_out_date: "2023-03-23"
    )
    @booking.save
    render template: "bookings/show"
  end
end
