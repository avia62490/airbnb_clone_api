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
    
    if @booking.are_dates_available
      @booking.save
      render template: "bookings/show"
    else
      render json: {message: "Date range conflicts with a current booking for this property"}
    end
    
  end

  def update

    @booking = Booking.find_by(id: params[:id])
    @booking.check_in_date = params[:check_in_date] || @booking.check_in_date
    @booking.check_out_date = params[:check_out_date] || @booking.check_out_date

    @booking.sub_total = @booking.calculate_sub_total
    @booking.service_fee = @booking.calculate_service_fee
    @booking.total = @booking.calculate_total

    if @booking.are_dates_available
      @booking.save
      render template: "bookings/show"
    else
      render json: {message: "Date range conflicts with a current booking for this property"}
    end

  end

  def index
    @bookings = Booking.all
    render template: "bookings/index"
  end

end
