defmodule Goten.Repo do
  use Ecto.Repo,
    otp_app: :goten,
    adapter: Ecto.Adapters.Postgres
end
