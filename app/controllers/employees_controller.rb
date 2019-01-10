class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy, :print_hierarchy]

  # GET /employees
  def index
    @employees = Employee.all

    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end
  def print_hierarchy
    if @employee.present?
      @employee.self_and_descendants
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity  
    end 
  end

  def top_employees
    @employee = Employee.get_top_salary
    render json: @employee
  end
  def resigned_employees
    @employee = Employee.resigned_datas
    render json: @employee
  end
  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:name, :salary, :rating, :resigned)
    end
end
