class LeaveAllotsController < ApplicationController
  before_action :set_leave_allot, only: [:show, :edit, :update, :destroy]

  def index
    @leave_allot = LeaveAllot.new
    @leave_allots = LeaveAllot.all
  end

  def show
  end

  def new
    @leave_allot = LeaveAllot.new
  end

  def edit
  end

  def create
    @leave_allot = LeaveAllot.new(leave_allot_params)

    respond_to do |format|
      if @leave_allot.save
        format.html { redirect_to leave_allots_path, notice: 'Leave allot was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_allot.update(leave_allot_params)
        format.html { redirect_to leave_allots_path, notice: 'Leave allot was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave_allot.destroy
    respond_to do |format|
      format.html { redirect_to leave_allots_path, notice: 'Leave allot was successfully destroyed.' }
    end
  end

  private
    def set_leave_allot
      @leave_allot = LeaveAllot.find(params[:id])
    end

    def leave_allot_params
      params.require(:leave_allot).permit(:leave_structure_id, :employee_id)
    end
end
