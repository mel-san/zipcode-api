defmodule ZipcodeApi.EmployeesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ZipcodeApi.Employees` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        city: "some city",
        state: "some state",
        zipcode: "some zipcode"
      })
      |> ZipcodeApi.Employees.create_employee()

    employee
  end
end
