class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = params[:user_id]
    @booking.item_id = params[:item_id]
    if @booking.save
      render :show, status: :cretaed
    else

    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted)
  end
end
