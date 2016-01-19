class LeaveApply < ActiveRecord::Base
	belongs_to :employee
	belongs_to :leave_head
	belongs_to :leave_structure
	validates_presence_of :employee_id , :from_date ,:to_date ,:leave_head_id ,:leave_structure_id
	validate :checking


	def checking
		leaves =LeaveApply.where("employee_id=?",self.employee_id)
		for leave in leaves
			if(leave.to_date == self.to_date || leave.to_date == self.from_date || leave.from_date == self.to_date || leave.from_date == self.from_date)
				errors.add(:Date, "You have already on leave this date")
			end
		end

		if (LeaveEmployee.where("employee_id=?",self.employee_id).nil?)
			errors.add(:employee_id, "No Leave Allotments")
		else

			if(self.to_date< Date.today && self.from_date< Date.today)
				if (self.from_date > self.to_date)
					errors.add(:to_date, "From Date Greater than To Date")
				else
					if (self.from_date.month == self.to_date.month)
						self.value = (self.from_date..self.to_date).count
						alloted_leaves = LeaveEmployee.where("employee_id=?",self.employee_id)

						for alloted_leave in alloted_leaves
							val = 0
							if (alloted_leave.pay_date.year == self.from_date.year)
								if(alloted_leave.pay_date.month == self.from_date.month)
									leave_heads = LeaveAssign.where("leave_structure_id=?" , self.leave_structure_id).pluck(:leave_head_id)
									count = 0;
									for leave_head in leave_heads
										count= count+1
										if (leave_head == self.leave_head_id)
											val = count
											count = 0;
										end
									end
									value = 0 
									available = []
									if (LeaveApply.where("employee_id=?",self.employee_id).empty?)
										available = alloted_leave.head_values.delete("^0-9,").split(",")
										value=available[val-1].to_i
									else
										available = LeaveApply.where("employee_id=?",self.employee_id).last.leave_available.split(",")
										value=available[val-1].to_i
									end
									
									
									if (self.value > value)
										errors.add(:value, "Cannot Allot Bacause u dont have enought leaves")
									else
									 	available[val-1]= available[val-1].to_i - self.value
										if available[val-1].to_i <= 0
										  available[val-1]=0
										end
										self.leave_available = available.join(",")
									end
								end
							else
								errors.add(:from_date, "No Leave Allotment for this month")
							end
						end
					end
				end
			else
				errors.add(:to_date, "Date should be less than todays date")
			end
		end
	end
end
