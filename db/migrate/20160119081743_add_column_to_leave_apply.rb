class AddColumnToLeaveApply < ActiveRecord::Migration
  def change
    add_column :leave_applies, :leave_available, :string
  end
end
