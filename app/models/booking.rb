class Booking < ApplicationRecord
  belongs_to :flat
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?
  validates :number_of_guests, presence: true
  validates :details, presence: true, length: {minimum: 20}

  def end_date_after_start_date?
    if end_date <= start_date
      errors.add :end_date, "must be after start date"
    end
  end
end
