import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bmi_calc, BmiCalcWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "I4Oa+JUzEV7tFa6CU9d3LomVcGvMno+KDM3i2NuS4zQNiOEgPVHCzGi/1t80b1hF",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
