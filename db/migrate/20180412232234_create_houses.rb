binclass CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :price

      t.timestamps
    end
  end
end
