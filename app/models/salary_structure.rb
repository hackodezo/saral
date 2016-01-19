class SalaryStructure < ActiveRecord::Base
	has_many :employee_salaries
	validates_presence_of :name,:basic, :da, :hra, :others,:conveyance, :special_allowance
	#validates_numericality_of :basic, :da, :hra, :others,:conveyance, :special_allowance
	before_save :calculate
	
	def calculate
		@basic_da= self.basic+self.da
		self.pf=(@basic_da*12)/100
		self.emp_pf=(@basic_da*5)/100
		self.gross=self.basic+self.da+self.hra+self.special_allowance+self.others+self.conveyance

		if (self.gross > 15000)
			self.pt=200
			self.gratuity =200
		else
			self.pt=100
			self.gratuity =100
		end
		self.monthly_ctc=self.emp_pf+self.gross+self.pt
	end
end
