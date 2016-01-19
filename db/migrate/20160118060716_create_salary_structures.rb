class CreateSalaryStructures < ActiveRecord::Migration
  def change
    create_table :salary_structures do |t|
      t.integer :basic
      t.integer :da
      t.integer :hra
      t.integer :pf
      t.integer :others
      t.integer :pt
      t.integer :emp_pf
      t.integer :gratuity
      t.integer :conveyance
      t.integer :special_allowance
      t.integer :gross
      t.integer :monthly_ctc
      t.string :name

      t.timestamps null: false
    end
  end
end
