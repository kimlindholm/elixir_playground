# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PlaygroundDb.Repo.insert!(%PlaygroundDb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

require Logger
Logger.info("Inserting seed data...")

alias PlaygroundDb.{Posts, Posts.Comments, Repo}
alias Posts.Post

post_count = Post |> Repo.aggregate(:count, :id)

if post_count == 0 do
  {:ok, post_1} = Posts.create_post(%{content: "First post"})
  Comments.create_comment(post_1, %{content: "First comment"})

  {:ok, _post_2} = Posts.create_post(%{content: "Second post"})

  {:ok, post_3} = Posts.create_post(%{content: "Third post"})
  Comments.create_comment(post_3, %{content: "Some comment"})

  {:ok, post_4} = Posts.create_post(%{content: "Fourth post"})
  Comments.create_comment(post_4, %{content: "Lorem ipsum"})
  Comments.create_comment(post_4, %{content: "Dolor sit amet"})
end
