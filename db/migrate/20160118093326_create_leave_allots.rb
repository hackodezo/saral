class CreateLeaveAllots < ActiveRecord::Migration
  def change
    create_table :leave_allots do |t|
      t.integer :leave_structure_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
