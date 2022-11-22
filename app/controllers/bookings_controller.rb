class BookingsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to my_bookings_path
    else
      render "flats/show", status: :unprocessable_entity
    end
  end

  def approve
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find(params[:id])
    @booking.approve = true
    authorize @booking
    @booking.save
    redirect_to flat_path(@flat)
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guests, :details, :user)
  end
end
