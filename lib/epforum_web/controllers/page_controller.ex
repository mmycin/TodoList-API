defmodule EpforumWeb.PageController do
  use EpforumWeb, :controller

  def about(conn, _params) do
    conn
    |> put_resp_header("content-security-policy", "default-src 'self'")
    |> put_resp_content_type("application/json")
    |> put_resp_header("access-control-allow-origin", "*")
    |> json(%{message: "This API is created by Tahcin Ul Karim Mycin"})
  end

  def user(conn, _params) do
    users = [
      %{id: 1, name: "John", email: "john@example.com"},
      %{id: 2, name: "Bob", email: "bob@example.com"},
      %{id: 3, name: "Ronald", email: "ron@example.com"},
      %{id: 4, name: "Sheldon", email: "sheldon@example.com"},
      %{id: 5, name: "Groudon", email: "groud@example.com"}
    ]

    conn
    |> put_resp_content_type("application/json")
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("content-security-policy", "default-src 'self'")
    |> json(%{users: users})
  end
end
