# mix phx.gen.context Posts.Comments Comment comments content:text post_id:references:posts

defmodule PlaygroundDb.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:post_id])
  end
end
