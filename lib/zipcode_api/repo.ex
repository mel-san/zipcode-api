defmodule ZipcodeApi.Repo do
  use Ecto.Repo,
    otp_app: :zipcode_api,
    adapter: Ecto.Adapters.Postgres
end
