class Flat < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :bedrooms, numericality: { only_integer: true }
  validates :number_of_guests, numericality: { only_integer: true }
  validates :price_per_night, numericality: { only_integer: true }
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true
  validates :rating, presence: true
end
