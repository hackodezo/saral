class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.date :dob
      t.string :address
      t.date :date_of_joining
      t.string :gender
      t.integer :department_id
      t.integer :designation_id
      t.string :state
      t.date :salary_date

      t.timestamps null: false
    end
  end
end
