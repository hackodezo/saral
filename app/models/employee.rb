class Employee < ActiveRecord::Base
	has_many :leave_allots
	has_many :leave_applies
	has_many :leave_employees
	belongs_to :department
	belongs_to :designation
	has_many :employee_salaries
	validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
	validates_format_of :address, :with => /\A[^`!@#\$%\^&*+_=]+\z/
	validates_presence_of :name,:dob,:address,:designation_id,:department_id,:gender,:state
	validate :validate_birth, if: :date_of_joining?

	def validate_birth
		if  !(self.date_of_joining.nil?)
			if !(self.date_of_joining > self.dob+20.years )
				errors.add(:dob, "Employee should be 20 yesrs old")
			end
			if !(self.date_of_joining < Date.today )
				errors.add(:date_of_joining, "Joining Date should be less than todays date ")
			end
		end

		if (Paymonth.where("month_year =? AND month_name =?",self.salary_date.year,self.salary_date.strftime("%b")).empty?)
			errors.add(:salary_date, "Salary Does not Belong to any Pay month ")
		end
	end
end
