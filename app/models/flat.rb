class Flat < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :bedrooms, numericality: { only_integer: true }
  validates :number_of_guests, numericality: { only_integer: true }
  validates :price_per_night, numericality: { only_integer: true }
end