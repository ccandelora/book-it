class ChangePaymentToPaymentId < ActiveRecord::Migration
  def self.up
    remove_column :bookings, :payment
    add_column :bookings, :payment_id, :integer
  end

  def self.down
    remove_column :bookings, :payment_id
    add_column :bookings, :payment, :string
  end
end
