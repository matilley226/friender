class AddAddressLatitudeToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :address_latitude, :float
  end
end
