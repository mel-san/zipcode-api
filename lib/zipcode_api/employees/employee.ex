defmodule ZipcodeApi.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :city, :string
    field :state, :string
    field :zipcode, :integer

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:zipcode, :state, :city])
    |> validate_required([:zipcode, :state, :city])
  end
end
