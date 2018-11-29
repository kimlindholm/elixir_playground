defmodule PlaygroundDb.Posts.Comments.Comment do
  @moduledoc """
  The Comment schema.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias PlaygroundDb.Posts.Post

  @derive {Jason.Encoder, only: [:id, :content]}

  schema "comments" do
    field :content, :string
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def create_changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :post_id])
    |> validate_required([:content, :post_id])
    |> foreign_key_constraint(:post_id)
  end

  @doc false
  def update_changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
