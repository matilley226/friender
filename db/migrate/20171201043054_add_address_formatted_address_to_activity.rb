class AddAddressFormattedAddressToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :address_formatted_address, :string
  end
end
