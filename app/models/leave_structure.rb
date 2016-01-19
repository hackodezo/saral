class LeaveStructure < ActiveRecord::Base
	has_many :leave_allots
	has_many :leave_assigns
	has_many :leave_heads, through: :leave_assigns
end
