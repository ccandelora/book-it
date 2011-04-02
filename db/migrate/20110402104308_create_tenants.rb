class CreateTenants < ActiveRecord::Migration
  def self.up
    create_table :tenants do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :email
      t.string :phone
      t.text :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :tenants
  end
end
