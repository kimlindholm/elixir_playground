defmodule PlaygroundDb.Posts.Comments do
  @moduledoc """
  The Posts.Comments context.
  """

  import Ecto.Query, warn: false
  alias PlaygroundDb.Posts.{Comments.Comment, Post}
  alias PlaygroundDb.Repo

  @doc """
  Returns the list of comments for a post.

  ## Examples

      iex> list_comments(post)
      [%Comment{}, ...]

  """
  def list_comments(%Post{} = post) do
    Comment
    |> where(post_id: ^post.id)
    |> Repo.all()
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Creates a comment for a post.

  ## Examples

      iex> create_comment(post, %{field: value})
      {:ok, %Comment{}}

      iex> create_comment(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(%Post{} = post, attrs \\ %{}) do
    attrs = Map.put(attrs, :post_id, post.id)

    %Comment{}
    |> Comment.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{source: %Comment{}}

  """
  def change_comment(%Comment{} = comment) do
    Comment.update_changeset(comment, %{})
  end
end
