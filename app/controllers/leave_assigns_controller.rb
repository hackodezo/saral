class LeaveAssignsController < ApplicationController
  before_action :set_leave_assign, only: [:show, :edit, :update, :destroy]

  def index
    @leave_structure = LeaveStructure.find(params[:leave_structure_id])
    @leave_assigns = LeaveAssign.where("leave_structure_id = ?", @leave_structure.id)
  end

  def show
  end

  def new
    @leave_structure = LeaveStructure.find(params[:leave_structure_id])
    @leave_assign = LeaveAssign.new
  end

  def edit
    @leave_structure = LeaveStructure.find(params[:leave_structure_id])
    @leave_assign = LeaveAssign.find(params[:id])
  end

  def create
    @leave_structure = LeaveStructure.find(params[:leave_structure_id])
    @leave_assign = LeaveAssign.new(leave_assign_params)
    respond_to do |format|
      if @leave_assign.save
        format.html { redirect_to leave_structure_leave_assigns_path, notice: 'Leave assign was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_assign.update(leave_assign_params)
        format.html { redirect_to leave_structure_leave_assigns_path, notice: 'Leave assign was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave_assign.destroy
    respond_to do |format|
      format.html { redirect_to leave_structure_leave_assigns_path, notice: 'Leave assign was successfully destroyed.' }
    end
  end

  private
    def set_leave_assign
      @leave_assign = LeaveAssign.find(params[:id])
    end

    def leave_assign_params
      params.require(:leave_assign).permit(:leave_head_id, :leave_structure_id)
    end
end
