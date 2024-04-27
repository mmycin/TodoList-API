defmodule Epforum.Repo do
  use Ecto.Repo,
    otp_app: :epforum,
    adapter: Ecto.Adapters.SQLite3
end
