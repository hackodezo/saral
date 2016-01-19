class LeaveAssign < ActiveRecord::Base
	belongs_to :leave_head
	belongs_to :leave_structure
	validates_presence_of :leave_head_id , :leave_structure_id
	validate :checking
	

	def checking()
		if !(LeaveAssign.where("leave_head_id =? AND leave_structure_id =?",self.leave_head_id, self.leave_structure_id).empty?)
			errors.add(:leave_head_id, "Leave Head Already Exisist")
		end
	end
end
