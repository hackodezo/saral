class LeaveAppliesController < ApplicationController
  before_action :set_leave_apply, only: [:show, :edit, :update, :destroy]

  def index
    @employee= Employee.find(params[:employee_id])
    @leave_apply = LeaveApply.new
    @leave_heads= @employee.leave_allots.first.leave_structure.leave_heads
    @leave_employees = @employee.leave_employees
   
    @leave_applies = @employee.leave_applies
     @leave_appl = @employee.leave_applies.last

  end

  def show
  end

  def new
    @employee= Employee.find(params[:employee_id])
    @leave_apply = LeaveApply.new
  end

  def edit
  end

  def create
    @employee= Employee.find(params[:employee_id])
    @leave_apply = LeaveApply.new(leave_apply_params)

    respond_to do |format|
      if @leave_apply.save
        format.html { redirect_to employee_leave_applies_path(@employee), notice: 'Leave apply was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @employee= Employee.find(params[:employee_id])
    respond_to do |format|
      if @leave_apply.update(leave_apply_params)
        format.html { redirect_to employee_leave_applies_path(@employee), notice: 'Leave apply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee= Employee.find(params[:employee_id])
    @leave_apply.destroy
    respond_to do |format|
      format.html { redirect_to employee_leave_applies_path(@employee), notice: 'Leave apply was successfully destroyed.' }
    end
  end

  private
    def set_leave_apply
      @leave_apply = LeaveApply.find(params[:id])
    end

    def leave_apply_params
      params.require(:leave_apply).permit(:from_date, :to_date, :leave_structure_id, :employee_id, :leave_head_id)
    end
end
