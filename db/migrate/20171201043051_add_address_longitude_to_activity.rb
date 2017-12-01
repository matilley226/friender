class AddAddressLongitudeToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :address_longitude, :float
  end
end
