class EmployeeSalariesController < ApplicationController
  before_action :set_employee_salary, only: [:show, :edit, :update, :destroy]

def index
    @employee_salaries = EmployeeSalary.all
  end

  def show
    @employee_salary=EmployeeSalary.find(params[:id])
  end

  def new
    @employee_salary = EmployeeSalary.new
    @states=State.all
  end

  def edit
  end

  def create
    @employee_salary = EmployeeSalary.new(employee_salary_params)

    respond_to do |format|

      if @employee_salary.save
        format.html { redirect_to employee_salaries_path, notice: 'Employee Salary was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee_salary.update(employee_salary_params)
        format.html { redirect_to employee_salaries_path, notice: 'Employee salary was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee_salary.destroy
    respond_to do |format|
      format.html { redirect_to employee_salaries_path notice: 'Employee salary was successfully destroyed.' }
    end
  end

  private
    def set_employee_salary
      @employee_salary = EmployeeSalary.find(params[:id])
    end

    def employee_salary_params
      params.require(:employee_salary).permit(:salary_date, :employee_id, :salary_structure_id)
    end
end
