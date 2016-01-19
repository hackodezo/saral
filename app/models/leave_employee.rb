class LeaveEmployee < ActiveRecord::Base
	belongs_to :leave_allot
	belongs_to :employee
	validates_presence_of :pay_date , :head_values ,:leave_allot_id , :employee_id
	validate :duplicate

	def duplicate
		pay_dates = LeaveEmployee.where("employee_id =?",self.employee_id).pluck(:pay_date)

		for pay_date in pay_dates
			if (pay_date.year == self.pay_date.year && pay_date.month == self.pay_date.month)
				errors.add(:pay_date, "Pay Month Leave Definition  Already Exist")
			end
		end
	end


end
