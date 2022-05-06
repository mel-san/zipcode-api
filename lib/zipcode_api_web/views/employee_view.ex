defmodule ZipcodeApiWeb.EmployeeView do
  use ZipcodeApiWeb, :view

  def render("index.json", %{employees: employees}) do
    render_many(employees,  __MODULE__, "employee.json")
  end

  def render("employee.json", %{employee: employee}) do
    %{
      zipcode: employee.zipcode,
      state: employee.state,
      city: employee.city}
  end

  def render("show.json", %{employee: employee}) do
    render_one(employee, __MODULE__, "employee.json")
  end
end
