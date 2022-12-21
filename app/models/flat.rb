class Flat < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :bedrooms, numericality: { only_integer: true }
  validates :number_of_guests, numericality: { only_integer: true }
  validates :price_per_night, numericality: { only_integer: true }
  validates :rating, presence: true

  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_city_and_description,
    against: [ :title, :city, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
