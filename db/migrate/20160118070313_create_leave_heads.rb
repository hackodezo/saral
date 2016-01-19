class CreateLeaveHeads < ActiveRecord::Migration
  def change
    create_table :leave_heads do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
