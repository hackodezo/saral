class LeaveEmployeesController < ApplicationController
  before_action :set_leave_employee, only: [:show, :edit, :update, :destroy]

  def index
    @leave_allot = LeaveAllot.find(params[:leave_allot_id])
    @leave_employees = @leave_allot.leave_employees
    @leave_structure = @leave_allot.leave_structure
    @leave_heads = @leave_structure.leave_heads
  end

  def show
  end

  def new
     @leave_allot = LeaveAllot.find(params[:leave_allot_id])
    @leave_employee = LeaveEmployee.new
    @leave_structure = @leave_allot.leave_structure
    @leave_heads = @leave_structure.leave_heads
  end

  def edit
     @leave_allot = LeaveAllot.find(params[:leave_allot_id])
    @leave_employee = LeaveEmployee.find(params[:id])
    @leave_structure = @leave_allot.leave_structure
    @leave_heads = @leave_structure.leave_heads
  end

  def create
    @leave_allot = LeaveAllot.find(params[:leave_allot_id])
    @leave_employee = LeaveEmployee.new(leave_employee_params)
    @leave_structure = @leave_allot.leave_structure
    @leave_heads = @leave_structure.leave_heads
    respond_to do |format|
      if @leave_employee.save
        format.html { redirect_to leave_allots_path, notice: 'Leave employee was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_employee.update(leave_employee_params)
        format.html { redirect_to leave_allots_path, notice: 'Leave employee was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave_employee.destroy
    respond_to do |format|
      format.html { redirect_to leave_allots_path, notice: 'Leave employee was successfully destroyed.' }
    end
  end

  private
    def set_leave_employee
      @leave_employee = LeaveEmployee.find(params[:id])
    end

    def leave_employee_params
      params.require(:leave_employee).permit(:employee_id , :pay_date , :leave_allot_id, :head_values => [])
    end
end
