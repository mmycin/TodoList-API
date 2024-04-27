defmodule Epforum.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Epforum.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Epforum.Todos.create_todo()

    todo
  end
end
