class CreateEmployeeSalaries < ActiveRecord::Migration
  def change
    create_table :employee_salaries do |t|
      t.date :salary_date
      t.integer :employee_id
      t.integer :salary_structure_id

      t.timestamps null: false
    end
  end
end
