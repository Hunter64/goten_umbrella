defmodule Goten.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Goten.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Goten.PubSub}
      # Start a worker by calling: Goten.Worker.start_link(arg)
      # {Goten.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Goten.Supervisor)
  end
end
