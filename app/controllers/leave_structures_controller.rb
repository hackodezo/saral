class LeaveStructuresController < ApplicationController
  before_action :set_leave_structure, only: [:show, :edit, :update, :destroy]

  def index
    @leave_structure = LeaveStructure.new
    @leave_structures = LeaveStructure.all
  end

  def show
  end

  def new
    @leave_structure = LeaveStructure.new
  end

  def edit
  end

  def create
    @leave_structure = LeaveStructure.new(leave_structure_params)

    respond_to do |format|
      if @leave_structure.save
        format.html { redirect_to leave_structures_path, notice: 'Leave structure was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_structure.update(leave_structure_params)
        format.html { redirect_to leave_structures_path, notice: 'Leave structure was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /leave_structures/1
  # DELETE /leave_structures/1.json
  def destroy
    @leave_structure.destroy
    respond_to do |format|
      format.html { redirect_to leave_structures_path, notice: 'Leave structure was successfully destroyed.' }
    end
  end

  private
    def set_leave_structure
      @leave_structure = LeaveStructure.find(params[:id])
    end

    def leave_structure_params
      params.require(:leave_structure).permit(:name)
    end
end
