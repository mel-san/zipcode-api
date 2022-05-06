# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ZipcodeApi.Repo.insert!(%ZipcodeApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#alias ZipcodeApi.Employees.Employee

#ZipcodeApi.Repo.delete_all(Employee)


#employee = %ZipcodeApi.Employees.Employee{
#  zipcode: 89449,
#  state: "Nevada",
#  city: "Stateline"
#}

#employee = %ZipcodeApi.Employees.Employee{
#  zipcode: 89703,
#  state: "Nevada",
#  city: "Carson City"
#}

#ZipcodeApi.Repo.insert!(employee)

alias ZipcodeApi.Repo
alias ZipcodeApi.Employees.Employee



File.stream!("/Users/melaniesanchez/Downloads/simplemaps_uszips_basicv1.80/uszips.csv")
|> Stream.drop(1)
|> CSV.Decoding.Decoder.decode(headers: [:zip, :city, :state_id])
|> Enum.each(fn {:ok, map} ->
  Employee.changeset(
    %Employee{},
    %{zipcode: map[:zip], city: map[:city], state: map[:state_id]})
  |> Repo.insert!()
end)
