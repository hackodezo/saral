class Paymonth < ActiveRecord::Base
	has_many :allot_leaves
	has_many :paymonth_leaves
	has_many :leave_heads, through: :paymonth_leaves
	before_save :determine
	validate :months

	def determine
		date = self.pay_month
		self.month_year = date.year
		self.day_count = Time.days_in_month(self.pay_month.month,self.pay_month.year)
		self.month_name = date.strftime("%b")
		if (Paymonth.where("month_year =? AND month_name =?",self.month_year,self.month_name))
			errors.add(:pay_month, "Pay Month already exsits")
		end
	end

	def months
		date = self.pay_month
		if !(Paymonth.where("month_year =? AND month_name =?",date.year,date.strftime("%b")).empty?)
			errors.add(:pay_month, "Pay Month already exsits")
		end
	end
end
