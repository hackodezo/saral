class LeaveHeadsController < ApplicationController
  before_action :set_leave_head, only: [:show, :edit, :update, :destroy]

  def index
    @leave_heads = LeaveHead.all
    @leave_head = LeaveHead.new
  end

  def show
  end

  def new
    @leave_head = LeaveHead.new
  end

  def edit
  end

  def create
    @leave_head = LeaveHead.new(leave_head_params)

    respond_to do |format|
      if @leave_head.save
        format.html { redirect_to leave_heads_path, notice: 'Leave head was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_head.update(leave_head_params)
        format.html { redirect_to leave_heads_path, notice: 'Leave head was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave_head.destroy
    respond_to do |format|
      format.html { redirect_to leave_heads_path, notice: 'Leave head was successfully destroyed.' }
    end
  end

  private
    def set_leave_head
      @leave_head = LeaveHead.find(params[:id])
    end

    def leave_head_params
      params.require(:leave_head).permit(:name)
    end
end
