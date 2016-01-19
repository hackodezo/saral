class PaymonthsController < ApplicationController
  before_action :set_paymonth, only: [:show, :edit, :update, :destroy]

  def index
    @paymonths = Paymonth.all
     @paymonth = Paymonth.new
  end

  def show
  end

  def new
    @paymonth = Paymonth.new
  end

  def edit
  end

  def create
    @paymonth = Paymonth.new(paymonth_params)

    respond_to do |format|
      if @paymonth.save
        format.html { redirect_to paymonths_path, notice: 'Paymonth was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @paymonth.update(paymonth_params)
        format.html { redirect_to paymonths_path, notice: 'Paymonth was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @paymonth.destroy
    respond_to do |format|
      format.html { redirect_to paymonths_path, notice: 'Paymonth was successfully destroyed.' }
    end
  end

  private
    def set_paymonth
      @paymonth = Paymonth.find(params[:id])
    end

    def paymonth_params
      params.require(:paymonth).permit(:month_year, :day_count, :month_name, :pay_month)
    end
end
