class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @flats = Flat.search_by_title_city_and_description(params[:query])
    else
      @flats = Flat.all
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("home.png")
      }
    end
  end

  def show
    @markers = [{
                  lat: @flat.latitude,
                  lng: @flat.longitude,
                  info_window: render_to_string(partial: "info_window", locals: { flat: @flat }),
                  image_url: helpers.asset_url("home.png")
                }]
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to my_flats_path
  end

  def my_flats
    @flats = current_user.flats
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("home.png")
      }
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :city, :description, :bedrooms, :number_of_guests, :price_per_night, :photo, :rating, :address)
  end
end
