defmodule PlaygroundDb.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :text

      timestamps()
    end

  end
end
