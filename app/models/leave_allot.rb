class LeaveAllot < ActiveRecord::Base
	belongs_to :employee
	belongs_to :leave_structure
	has_many :leave_employees
	validates_presence_of :employee_id , :leave_structure_id
	validates_uniqueness_of :employee_id
end
