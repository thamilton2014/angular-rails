class Api::EmployeesController < ApplicationController
  respond_to :json

  def index
    serialized_employees = ActiveModel::ArraySerializer.new(Employee.all,
      each_serializer: EmployeeSerializer)

    render json: serialized_employees
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee.as_json, status: :ok
    else
      render json: employee.errors.messages, status: 406
    end
  end

  def new
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee.as_json, status: :ok
    else
      render json: employee.errors.messages, status: 406
    end
  end

  def show
    employee = Employee.find(params[:id])
    render json: employee
  end

  def update
    employee = Employee.find(params[:id])

    if employee.update(employee_params)
      render json: employee
    else
      render json: employee.errors.messages, status: :bad_request
    end
  end

  private

  def employee_params
    attributes = [
        :salary,
        :name,
        :email,
        :ssn
    ]
    params.require(:employee).permit(attributes)
  end
end
