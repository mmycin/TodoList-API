defmodule Epforum.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Epforum.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Epforum.Posts.create_post()

    post
  end
end
