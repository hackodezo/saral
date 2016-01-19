class EmployeeSalary < ActiveRecord::Base

	belongs_to :employee
	belongs_to :salary_structure
	validates_presence_of :salary_structure_id,:employee_id , :salary_date
	

	
	


end
