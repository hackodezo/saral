class CreateLeaveEmployees < ActiveRecord::Migration
  def change
    create_table :leave_employees do |t|
      t.integer :leave_allot_id
      t.string :head_values

      t.timestamps null: false
    end
  end
end
