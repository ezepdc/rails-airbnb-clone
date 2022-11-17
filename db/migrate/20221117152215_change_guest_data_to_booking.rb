class ChangeGuestDataToBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :user_id, :string
    remove_column :bookings, :host_name, :string
    add_column :bookings, :guest_user, :string
  end
end
