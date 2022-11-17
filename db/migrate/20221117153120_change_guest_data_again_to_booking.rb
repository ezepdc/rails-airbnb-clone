class ChangeGuestDataAgainToBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :guest_user, :string
    add_column :bookings, :guest_name, :string
  end
end
