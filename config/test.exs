import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :zipcode_api, ZipcodeApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "zipcode_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :zipcode_api, ZipcodeApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9+xHPFqR3whLn8QN2Kvco9b9HzrA3wwRsaUBl7W8yRPiYDer++ttJhi5/bMoSdg5",
  server: false

# In test we don't send emails.
config :zipcode_api, ZipcodeApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
