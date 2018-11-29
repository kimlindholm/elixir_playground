defmodule PlaygroundDb.Posts.Post do
  @moduledoc """
  The Post schema.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias PlaygroundDb.Posts.Comments.Comment

  @derive {Jason.Encoder, only: [:id, :content, :comments]}

  schema "posts" do
    field :content, :string
    # foreign key: delete_all
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
