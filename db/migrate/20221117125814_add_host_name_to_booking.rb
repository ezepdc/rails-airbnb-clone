class AddHostNameToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :host_name, :string
  end
end
