class ChangeColumnsToBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :guest_name
    add_column :bookings, :user, :string
    add_column :bookings, :approve, :boolean, default: false
  end
end
