class CreatePaymonths < ActiveRecord::Migration
  def change
    create_table :paymonths do |t|
      t.integer :month_year
      t.integer :day_count
      t.string :month_name
      t.date :pay_month

      t.timestamps null: false
    end
  end
end
