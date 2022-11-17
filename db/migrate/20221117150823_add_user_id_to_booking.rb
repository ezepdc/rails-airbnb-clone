class AddUserIdToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_id, :string
  end
end
