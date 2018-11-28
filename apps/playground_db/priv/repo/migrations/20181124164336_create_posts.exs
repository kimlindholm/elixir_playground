# mix phx.gen.context Posts Post posts content:text

defmodule PlaygroundDb.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :text, null: false

      timestamps()
    end

  end
end
