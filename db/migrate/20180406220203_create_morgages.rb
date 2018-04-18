class CreateMorgages < ActiveRecord::Migration[5.1]
  def change
    create_table :morgages do |t|
      t.integer :amount
      t.integer :timeframe_in_years
      t.integer :annual_interest_rate
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
