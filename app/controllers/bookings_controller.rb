class BookingsController < ApplicationController
  before_action :authenticate_user, except: [:index] 

  def create
    
    @booking = current_user.bookings.build(
      property_id: params[:property_id],
      check_in_date: params[:check_in_date],
      check_out_date: params[:check_out_date]
    )
    @booking.sub_total = @booking.calculate_sub_total
    @booking.service_fee = @booking.calculate_service_fee
    @booking.total = @booking.calculate_total
    
    overlapping_bookings = Booking.where(
      property_id: @booking.property_id
    ).where(
      "check_in_date < ? AND
       check_out_date > ?",
      @booking.check_out_date,
      @booking.check_in_date
    )
    
    if overlapping_bookings.any?
      render json: {message: "Date range conflicts with a current booking for this property"}
    else
      @booking.save
      render template: "bookings/show"
    end
    
  end

  def update
    @booking = Booking.find_by(id: params[:id])
    # render json: @booking.date_range.as_json
    render json: @booking.calculate_sub_total.as_json

  end

  def index
    @bookings = Booking.all
    render template: "bookings/index"
  end

end
