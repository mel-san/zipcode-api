defmodule ZipcodeApi.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :zipcode, :string
      add :state, :string
      add :city, :string

      timestamps()
    end
  end
end
