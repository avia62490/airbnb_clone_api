class BookingsController < ApplicationController
  # before_action :authenticate_user

  def create
    @booking = Booking.new(
      property_id: params[:property_id],
      user_id: params[:user_id],
      check_in_date: params[:check_in_date],
      check_out_date: params[:check_out_date]
    )
    @booking.save
    render template: "bookings/show"
  end
end
