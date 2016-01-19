class CreateLeaveApplies < ActiveRecord::Migration
  def change
    create_table :leave_applies do |t|
      t.date :from_date
      t.date :to_date
      t.integer :leave_structure_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
