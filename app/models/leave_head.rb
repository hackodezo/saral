class LeaveHead < ActiveRecord::Base
	has_many :leave_assigns
	has_many :leave_structures, through: :leave_assigns
end