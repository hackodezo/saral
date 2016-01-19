class CreateLeaveAssigns < ActiveRecord::Migration
  def change
    create_table :leave_assigns do |t|
      t.integer :leave_head_id
      t.integer :leave_structure_id

      t.timestamps null: false
    end
  end
end
