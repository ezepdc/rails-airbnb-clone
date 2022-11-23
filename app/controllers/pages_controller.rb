class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flats = policy_scope(Flat)
    if params[:query].present?
      @flats = Flat.search_by_title_city_and_description(params[:query])
    else
      @flats = Flat.all
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "/flats/info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("home.png")
      }
    end
  end
end
