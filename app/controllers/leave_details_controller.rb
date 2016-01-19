class LeaveDetailsController < ApplicationController
  def index
  	@employees = Employee.all
  end
end
