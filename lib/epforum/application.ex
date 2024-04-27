defmodule Epforum.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EpforumWeb.Telemetry,
      Epforum.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:epforum, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:epforum, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Epforum.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Epforum.Finch},
      # Start a worker by calling: Epforum.Worker.start_link(arg)
      # {Epforum.Worker, arg},
      # Start to serve requests, typically the last entry
      EpforumWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Epforum.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EpforumWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
