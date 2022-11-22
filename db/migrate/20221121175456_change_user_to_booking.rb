class ChangeUserToBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :user
    add_reference :bookings, :user
  end
end
