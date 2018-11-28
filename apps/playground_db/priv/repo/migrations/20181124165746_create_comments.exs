# mix phx.gen.context Posts.Comments Comment comments content:text post_id:references:posts

defmodule PlaygroundDb.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text, null: false
      add :post_id, references(:posts, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:comments, [:post_id])
  end
end
