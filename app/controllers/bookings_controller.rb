class BookingsController < ApplicationController
  # before_action :authenticate_user

  def create
    location = Property.find_by(id: params[:property_id])
    nightly_rate = location.price_rate
    check_in =  params[:check_in_date]
    check_out =  params[:check_out_date]
    date_range = (check_in..check_out).to_a
    sub_total = nightly_rate * (date_range.length - 1)
    service_fee = location.service_fee
    total = sub_total + service_fee

    @booking = Booking.new(
      property_id: location.id,
      user_id: params[:user_id],
      check_in_date: params[:check_in_date],
      check_out_date: params[:check_out_date],
      sub_total: sub_total,
      service_fee: service_fee,
      total: total
    )
    @booking.save
    render template: "bookings/show"
  end

  def index
    @bookings = Booking.all
    render template: "bookings/index"
    # render json: @bookings.as_json
  end

end
