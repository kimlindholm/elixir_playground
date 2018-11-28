defmodule PlaygroundDb.Posts.CommentsTest do
  use PlaygroundDb.DataCase

  alias PlaygroundDb.Posts.Comments

  describe "comments" do
    alias PlaygroundDb.Posts
    alias Posts.Comments.Comment
    alias Posts.Post

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(%{content: "some content"})
        |> Posts.create_post()

      post |> Repo.preload(:comments)
    end

    def comment_fixture(%Post{} = post \\ post_fixture(), attrs \\ %{}) do
      attrs = Enum.into(attrs, @valid_attrs)
      {:ok, comment} = Comments.create_comment(post, attrs)

      comment
    end

    test "list_comments/1 returns all comments for given post" do
      post = post_fixture()
      comment = comment_fixture(post)
      assert Comments.list_comments(post) == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Comments.get_comment!(comment.id) == comment
    end

    test "create_comment/2 with valid data creates a comment" do
      post = post_fixture()
      assert {:ok, %Comment{} = comment} = Comments.create_comment(post, @valid_attrs)
      assert comment.content == "some content"
    end

    test "create_comment/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Comments.create_comment(post, @invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{} = comment} = Comments.update_comment(comment, @update_attrs)
      assert comment.content == "some updated content"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Comments.update_comment(comment, @invalid_attrs)
      assert comment == Comments.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Comments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Comments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Comments.change_comment(comment)
    end
  end
end
