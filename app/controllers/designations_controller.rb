class DesignationsController < ApplicationController
  before_action :set_designation, only: [:show, :edit, :update, :destroy]

  def index
    @designations=Designation.all
    @designation=Designation.new
  end

  def new
    @designation=Designation.new
  end

  def create
    @designation = Designation.new(designation_params)
    respond_to do |format|
      if @designation.save
        format.html { redirect_to designations_path(), notice: 'Designation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @designation.update(designation_params)
        format.html { redirect_to @designation, notice: 'Designation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @designation.destroy
    respond_to do |format|
      format.html { redirect_to designations_url, notice: 'Designation was successfully destroyed.' }
    end
  end

  private
    def set_designation
      @designation = Designation.find(params[:id])
    end

    def designation_params
      params.require(:designation).permit(:name)
    end
end
