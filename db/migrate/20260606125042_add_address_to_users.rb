class AddAddressToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :address, :string, null: false, default: "" # default value to avoid issues with existing records
  end
end
