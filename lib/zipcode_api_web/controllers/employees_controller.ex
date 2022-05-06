defmodule ZipcodeApiWeb.EmployeeController do
  use ZipcodeApiWeb, :controller

  def index(conn, %{"zipcode" => zipcode}) do
    {zipcode, _} = Integer.parse(zipcode)
    employees = ZipcodeApi.Employees.list_employees_for(zipcode)
    render(conn,"index.json", employees: employees)
  end

  def index(conn, _params) do
    employees = ZipcodeApi.Employees.list_employees()
    render(conn, "index.json", employees: employees)
  end

  def show(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    employee = ZipcodeApi.Employees.get_employee!(id)
    render(conn, "show.json", employee: employee)
  end
end
